import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppColors {
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    // primarySwatch: Colors.blue,
    seedColor: const Color(0xff3498db),
    brightness: Brightness.light,
  );
  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff3498db),
    brightness: Brightness.dark,
  );

  static const Color black333 = Color(0xFF333333);
}

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    textTheme: textNormalTheme(),
    checkboxTheme: normalCheckBoxTheme(),
    iconButtonTheme: IconButtonThemeData(style: lightIconButtonNormalStyle()),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: lightOutLineButtonNormalStyle(),
    ),
    tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
    colorScheme: AppColors.lightColorScheme,
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    appBarTheme: AppBarTheme(
      //elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.black333,
      ),
      foregroundColor: AppColors.black333,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.transparent,
      ),
    ),

    // radioTheme: RadioThemeData(
    //   fillColor: MaterialStateProperty.all(AppColors.lightColorScheme.primary),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.all(AppColors.lightColorScheme.primary),
    // ),
    // tabBarTheme: TabBarTheme(
    //   labelColor: AppColors.lightColorScheme.primary,
    //   unselectedLabelColor: Colors.white70,
    //   indicatorSize: TabBarIndicatorSize.tab,
    //   indicator: RectangularIndicator(
    //     color: Colors.white.withOpacity(.8),
    //     topLeftRadius: 24,
    //     bottomLeftRadius: 24,
    //     topRightRadius: 24,
    //     bottomRightRadius: 24,
    //     verticalPadding: 8,
    //     horizontalPadding: 0,
    //   ),
    // ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: AppColors.darkColorScheme,
    visualDensity: VisualDensity.standard,
    appBarTheme: AppBarTheme(
      //elevation: 0,

      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.transparent,
      ),
    ),
    // radioTheme: RadioThemeData(
    //   fillColor: MaterialStateProperty.all(AppColors.darkColorScheme.primary),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.all(AppColors.darkColorScheme.primary),
    // ),
    // tabBarTheme: TabBarTheme(
    //   labelColor: AppColors.darkColorScheme.primary,
    //   unselectedLabelColor: Colors.white70,
    //   indicator: RectangularIndicator(
    //     color: Colors.white.withOpacity(.2),
    //     topLeftRadius: 24,
    //     bottomLeftRadius: 24,
    //     topRightRadius: 24,
    //     bottomRightRadius: 24,
    //     verticalPadding: 8,
    //     horizontalPadding: 0,
    //   ),
    // ),
  );
  static const vGap4 = SizedBox(
    height: 4,
  );
  static const vGap8 = SizedBox(
    height: 8,
  );
  static const vGap12 = SizedBox(
    height: 12,
  );
  static const vGap24 = SizedBox(
    height: 24,
  );
  static const vGap32 = SizedBox(
    height: 32,
  );
  static const vGap48 = SizedBox(
    height: 48,
  );

  static const hGap4 = SizedBox(
    width: 4,
  );
  static const hGap8 = SizedBox(
    width: 8,
  );
  static const hGap12 = SizedBox(
    width: 12,
  );
  static const hGap16 = SizedBox(
    width: 16,
  );

  static const hGap24 = SizedBox(
    width: 24,
  );
  static const hGap32 = SizedBox(
    width: 32,
  );
  static const hGap48 = SizedBox(
    width: 48,
  );

  static const edgeInsetsH4 = EdgeInsets.symmetric(horizontal: 4);
  static const edgeInsetsH8 = EdgeInsets.symmetric(horizontal: 8);
  static const edgeInsetsH12 = EdgeInsets.symmetric(horizontal: 12);
  static const edgeInsetsH16 = EdgeInsets.symmetric(horizontal: 16);
  static const edgeInsetsH20 = EdgeInsets.symmetric(horizontal: 20);
  static const edgeInsetsH24 = EdgeInsets.symmetric(horizontal: 24);

  static const edgeInsetsV4 = EdgeInsets.symmetric(vertical: 4);
  static const edgeInsetsV8 = EdgeInsets.symmetric(vertical: 8);
  static const edgeInsetsV12 = EdgeInsets.symmetric(vertical: 12);
  static const edgeInsetsV24 = EdgeInsets.symmetric(vertical: 24);

  static const edgeInsetsA4 = EdgeInsets.all(4);
  static const edgeInsetsA8 = EdgeInsets.all(8);
  static const edgeInsetsA12 = EdgeInsets.all(12);
  static const edgeInsetsA16 = EdgeInsets.all(16);
  static const edgeInsetsA20 = EdgeInsets.all(20);
  static const edgeInsetsA24 = EdgeInsets.all(24);

  static const edgeInsetsR4 = EdgeInsets.only(right: 4);
  static const edgeInsetsR8 = EdgeInsets.only(right: 8);
  static const edgeInsetsR12 = EdgeInsets.only(right: 12);
  static const edgeInsetsR16 = EdgeInsets.only(right: 16);
  static const edgeInsetsR20 = EdgeInsets.only(right: 20);
  static const edgeInsetsR24 = EdgeInsets.only(right: 24);

  static const edgeInsetsL1 = EdgeInsets.only(left: 1);

  static const edgeInsetsL4 = EdgeInsets.only(left: 4);
  static const edgeInsetsL8 = EdgeInsets.only(left: 8);
  static const edgeInsetsL12 = EdgeInsets.only(left: 12);
  static const edgeInsetsL16 = EdgeInsets.only(left: 16);
  static const edgeInsetsL20 = EdgeInsets.only(left: 20);
  static const edgeInsetsL24 = EdgeInsets.only(left: 24);

  static const edgeInsetsT4 = EdgeInsets.only(top: 4);
  static const edgeInsetsT8 = EdgeInsets.only(top: 8);
  static const edgeInsetsT12 = EdgeInsets.only(top: 12);
  static const edgeInsetsT24 = EdgeInsets.only(top: 24);

  static const edgeInsetsB4 = EdgeInsets.only(bottom: 4);
  static const edgeInsetsB8 = EdgeInsets.only(bottom: 8);
  static const edgeInsetsB12 = EdgeInsets.only(bottom: 12);
  static const edgeInsetsB24 = EdgeInsets.only(bottom: 24);

  static BorderRadius radius4 = BorderRadius.circular(4);
  static BorderRadius radius8 = BorderRadius.circular(8);
  static BorderRadius radius12 = BorderRadius.circular(12);
  static BorderRadius radius24 = BorderRadius.circular(24);
  static BorderRadius radius32 = BorderRadius.circular(32);
  static BorderRadius radius48 = BorderRadius.circular(48);

  static const colorBlack33 = Color(0xff333333);

  /// 顶部状态栏的高度
  static double get statusBarHeight => MediaQuery.of(Get.context!).padding.top;

  /// 底部导航条的高度
  static double get bottomBarHeight =>
      MediaQuery.of(Get.context!).padding.bottom;

  static TextStyle get titleStyleWhite => TextStyle(
        color: Colors.white,
        fontSize: 40,
      );
  static TextStyle get titleStyleBlack => TextStyle(
        color: colorBlack33,
        fontSize: 40,
      );
  static TextStyle get textStyleWhite => TextStyle(
        color: Colors.white,
        fontSize: 32,
      );
  static TextStyle get textStyleBlack => TextStyle(
        color: colorBlack33,
        fontSize: 32,
      );
  static TextStyle get subTextStyleWhite => TextStyle(
        color: Colors.white54,
        fontSize: 24,
        height: 1.0,
      );
  static TextStyle get subTextStyleBlack => TextStyle(
        color: Colors.black54,
        fontSize: 24,
        height: 1.0,
      );

  static List<BoxShadow> get highlightShadow => [
        BoxShadow(
          blurRadius: 6,
          spreadRadius: 2,
          color: Colors.pink.shade400,
          //color: Color.fromARGB(255, 255, 120, 167),
        )
      ];
  static Divider get divider => Divider(
        height: 1,
        thickness: 1,
        indent: 16,
        endIndent: 16,
        color: Colors.grey.withOpacity(.1),
      );

  static ButtonStyle lightOutLineButtonSiteStyle() {
    return ButtonStyle(
      side: WidgetStateProperty.all(
        BorderSide(color: Colors.black,width: 0.5), // 设置边框颜色为蓝色
      ),
       shape: WidgetStateProperty.all(
         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
       ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.pressed)) {
          return Colors.blue.withOpacity(0.5); // 选中状态下的颜色
        }
        return null;
      }),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    );
  }


  static ButtonStyle tabOutLinedButtonStyle(bool selected) {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        const Size(20, 30), // 设置按钮的最小宽度和高度
      ),
      textStyle: WidgetStateProperty.all(TextStyle(fontSize: 12)),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ),
      foregroundColor:  WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        return Colors.white;
      }),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused) || states.contains(WidgetState.pressed) || selected) {
          return Colors.black.withOpacity(0.1); // 选中状态下的颜色
        }
        return Colors.black.withOpacity(0.2);
      }),
      backgroundColor: WidgetStateProperty.all(Colors.black.withOpacity(0.1)),
    );
  }

  static ButtonStyle filterOutLinedButtonStyle(bool selected) {
    return ButtonStyle(
      side: WidgetStateProperty.all(
        BorderSide(color: Colors.black,width: 0.5), // 设置边框颜色为蓝色
      ),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      foregroundColor:  WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if(states.contains(WidgetState.focused) || states.contains(WidgetState.pressed) || selected){
            return Colors.blue;
          }else{
          return Colors.black;
        }
      }),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused) || states.contains(WidgetState.pressed)) {
          return Colors.black.withOpacity(0.1); // 选中状态下的颜色
        }
        return null;
      }),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    );
  }

  static ButtonStyle lightOutLineButtonNormalStyle() {
    return ButtonStyle(
      side: WidgetStateProperty.all(
        BorderSide(color: Colors.black.withOpacity(0.1)), // 设置边框颜色为蓝色
      ),
      minimumSize: WidgetStateProperty.all(
        const Size(40, 60), // 设置按钮的最小宽度和高度
      ),
      overlayColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.pressed)) {
          return Colors.blue.withOpacity(0.5); // 选中状态下的颜色
        }
        return null;
      }),
      backgroundColor:
          WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.1)),
    );
  }

  static ButtonStyle lightSettingOutlineButtonStyle() {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.fromLTRB(16, 0, 16, 0),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16),
      ),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    );
  }

  static CheckboxThemeData normalCheckBoxTheme() {
    return const CheckboxThemeData(
       shape: CircleBorder(),
    );
  }
  static   ButtonStyle lightIconButtonNormalStyle() {
    return ButtonStyle(overlayColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.focused) || states.contains(WidgetState.pressed)) {
        return Colors.blue.withOpacity(0.5); // 选中状态下的颜色
      }
      return null;
    }));
  }

  static  TextTheme textNormalTheme() {
    return const TextTheme(
    bodyMedium: TextStyle(
      // fontFamily: 'Alima ma FangYuanTi VF',
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      // fontFamily: 'Alima ma FangYuanTi VF',
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold
    ),
  );
  }
}
