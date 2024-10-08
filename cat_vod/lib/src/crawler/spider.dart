/*
 * @Author: jadehh
 * @Date: 2024-08-14 14:30:01
 * @LastEditTime: 2024-08-14 14:44:34
 * @LastEditors: jadehh
 * @Description: 
 * @FilePath: \dramasource\lib\catvod\crawler\spider.dart
 * 
 */

import 'dart:collection';


abstract class Spider {

  Future initEngine() async {
  }

  Future init(String ext) async {
  }

  Future<String> homeContent(bool filter) async {
    return "";
  }

  Future<String> homeVideoContent()  async{
    return "";
  }

  Future<String> categoryContent(String tid, String pg, bool filter, Map<String, dynamic> extend) async{
    return "";
  }

  Future<String>  detailContent(List<String> ids) async{
    return "";
  }

  String searchContent(String key, bool quick) {
    return "";
  }

  String searchContentByPage(String key, bool quick, String pg) {
    return "";
  }

  String playerContent(String flag, String id, List<String> vipFlags) {
    return "";
  }

  Future<dynamic> proxyLocal(Map<String, String> params) async  {
        return null;
    }

  void destroy() {}


}
