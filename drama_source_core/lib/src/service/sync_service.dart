/*
 * @Author: jadehh
 * @Date: 2024-08-19 16:03:37
 * @LastEditTime: 2024-08-22 14:07:57
 * @LastEditors: jadehh
 * @Description: 
 * @FilePath: \drama_source\drama_source_core\lib\src\service\sync_service.dart
 * 
 */
import 'dart:convert';
import 'dart:io';

import 'package:cat_vod/cat_vod.dart';
import 'package:drama_source_log/drama_source_log.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:drama_source_core/drama_source_core.dart';
import 'package:get/get.dart';
import 'package:udp/udp.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

class SyncService extends GetxService {
  static SyncService get instance => Get.find<SyncService>();
  static SyncService get() {return instance;}

  UDP? udp;
  RxList<SyncClinet> scanClients = <SyncClinet>[].obs;
  static const int udpPort = 23235;
  static const int httpPort = 9978;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  NetworkInfo networkInfo = NetworkInfo();
  HttpServer? server;
  var ipAddress = "".obs;
  var httpRunning = false.obs;
  var httpErrorMsg = "".obs;

  var deviceId = "";

  @override
  void onInit() {
    Log.d('TVService init');
    deviceId = (const Uuid().v4()).split('-').first;
    listenUDP();
    initServer();
    super.onInit();
  }

  /// 监听其他端UDP广播的回复
  void listenUDP() async {
    udp = await UDP.bind(Endpoint.any(port: const Port(udpPort)));
    udp!.asStream().listen(listenUdp);
  }

  void listenUdp(Datagram? datagram) {
    var str = String.fromCharCodes(datagram!.data);
    Log.i("Received: $str from ${datagram.address}:${datagram.port}");
    if (str.startsWith('{') && str.endsWith('}')) {
      var data = json.decode(str);
      //如果是自己的广播，就不处理
      if (data['id'] == deviceId) {
        return;
      }
      //处理Hello的广播
      if (data["type"] == "hello") {
        //如果http服务已经启动，就回复自己的信息
        if (httpRunning.value) {
          sendInfo();
        }
        return;
      }
      // 处理其他端的广播
      // 地址直接从datagram中获取，能收到回复说明地址是可以连通的
      var address = datagram.address.address;
      //检查是否已经存在
      var index = scanClients.indexWhere((element) => element.address == address);
      if (index == -1) {
        scanClients.add(
          SyncClinet(
            id: data['id'],
            name: data['name'],
            address: address,
            port: httpPort,
            type: data['type'],
          ),
        );
      }
    }
  }

  /// 发送UDP广播至其他端
  void sendHello() async {
    await udp!.send(
      json.encode({
        "id": deviceId,
        "type": "hello",
      }).codeUnits,
      Endpoint.broadcast(
        port: const Port(udpPort),
      ),
    );
    Log.i("send udp: hello");
  }

  /// UDP广播自身信息
  void sendInfo() async {
    //var ip = await getLocalIP();

    var name = await getDeviceName();

    var data = {
      "id": deviceId,
      "type": Platform.operatingSystem,
      //'version': Utils.packageInfo.version,
      "name": name,
      //"address": ip,
      //"port": httpPort,
    };

    await udp!.send(
      json.encode(data).codeUnits,
      Endpoint.broadcast(
        port: const Port(udpPort),
      ),
    );
    Log.i("send udp info: $data");
  }

  Future<String> getDeviceName() async {
    var name = "SimpleLive-${Platform.operatingSystem}";
    if (Platform.isAndroid) {
      var info = await deviceInfo.androidInfo;
      name = info.model;
    } else if (Platform.isIOS) {
      var info = await deviceInfo.iosInfo;
      name = info.name;
    } else if (Platform.isMacOS) {
      var info = await deviceInfo.macOsInfo;
      name = info.computerName;
    } else if (Platform.isLinux) {
      var info = await deviceInfo.linuxInfo;
      name = info.name;
    } else if (Platform.isWindows) {
      var info = await deviceInfo.windowsInfo;
      name = info.userName;
    }
    return name;
  }

  void refreshClients() {
    scanClients.clear();
    sendHello();
  }

  /// 读取本地IP
  /// - 如果是wifi，直接获取wifi的IP
  /// - 如果是有线，获取所有的IP，找到全部的IP
  Future<String> getLocalIP() async {
    String? ip = "";
    try {
      ip = await networkInfo.getWifiIP();
    } catch (e) {
      Log.logPrint(e);
    }
    try {
      if (ip == null || ip.isEmpty) {
        var interfaces = await NetworkInterface.list();
        var ipList = <String>[];
        for (var interface in interfaces) {
          for (var addr in interface.addresses) {
            if (addr.type.name == 'IPv4' && !addr.address.startsWith('127') && !addr.isMulticast && !addr.isLoopback) {
              ipList.add(addr.address);
              break;
            }
          }
        }
        ip = ipList.join(';');
      }
    } catch (e) {
      Log.logPrint(e);
    }
    return ip ?? "";
  }

  /// 初始化HTTP服务
  void initServer() async {
    try {
      var serverRouter = Router();
      serverRouter.get('/', _helloRequest);
      serverRouter.get('/proxy', _proxy);
      var server = await shelf_io.serve(serverRouter, InternetAddress.anyIPv4, httpPort);

      // Enable content compression
      server.autoCompress = true;

      httpRunning.value = true;

      var ip = await getLocalIP();
      ipAddress.value = ip;

      Log.d('Serving at http://$ip:${server.port}');
    } catch (e) {
      httpErrorMsg.value = e.toString();
      Log.logPrint(e);
    }
  }

  /// 测试服务能否正常访问
  shelf.Response _helloRequest(shelf.Request request) {
    return toJsonResponse({
      'status': true,
      'message': 'http server is running...',
      "version": 'SimpeLive ${Platform.operatingSystem} v${Utils.packageInfo.version}',
    });
  }

  Future<shelf.Response> _proxy(shelf.Request request) async {
    try {
      var result = await VodConfig.get().proxyLocal(request.url.queryParameters);
      return toDataResponse(result);
    } catch (e,stackTrace) {
      Log.e(e.toString(), stackTrace);
      return toJsonResponse({
        'status': false,
        'message': e.toString(),
      });
    }
  }

  /// 发送自己的信息
  // Future<shelf.Response> _infoRequest(shelf.Request request) async {
  //   var name = await getDeviceName();
  //   return toJsonResponse({
  //     "id": deviceId,
  //     'type': Platform.operatingSystem,
  //     'name': name,
  //     'version': Utils.packageInfo.version,
  //     'address': ipAddress.value,
  //     'port': httpPort,
  //   });
  // }

  
  shelf.Response toJsonResponse(Map<String, dynamic> data) {
    return shelf.Response.ok(
      json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
      encoding: Encoding.getByName('utf-8'),
    );
  }

  shelf.Response toDataResponse(String resp) {
    var response = jsonDecode(resp);
    Map<String, dynamic> dynamicHeaders= response["headers"];

    Map<String, Object> headers = {};

    dynamicHeaders.forEach((key, value) {
      if (value.runtimeType == int){
        headers[key] = value.toString() as Object;
      }else{
        headers[key] = value as Object;
      }
    });
    if (response["code"] == 200){
      return shelf.Response.ok(
          response["content"],
          headers: headers
      );
    }else{
      return shelf.Response.ok(response["data"],headers: {"Content-Type": "application/json"});
    }

  }



  @override
  void onClose() {
    Log.d('SyncService close');
    udp?.close();
    server?.close(force: true);
    super.onClose();
  }

   Future<String> getAddressByLocal(bool local) async{
    return "http://" + (local ? "127.0.0.1" : await Util.getIp()) + ":" + httpPort.toString();
  }

   Future<String> getAddressByPath(String path) async {
    return await getAddressByLocal(false) + "/" + path;
  }
}

class SyncClinet {
  final String id;
  final String name;
  final String address;
  final int port;
  final String type;
  SyncClinet({
    required this.id,
    required this.name,
    required this.address,
    required this.port,
    required this.type,
  });
}
