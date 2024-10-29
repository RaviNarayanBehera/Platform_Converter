import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter/screens/Ios/ios_ui.dart';
import 'package:platform_converter/screens/android.dart';
import 'package:platform_converter/screens/theme/global.dart';

import 'controller/platform_convert.dart';
import 'controller/theme_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => converter.isIos.value
        ? CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: theme.isDark.value
          ? GlobalTheme.cupertinoThemeDark
          : GlobalTheme.cupertinoThemeLight,
      home: IosUi(),
    )
        : GetMaterialApp(
      theme: GlobalTheme.themeLight,
      darkTheme: GlobalTheme.themeDark,
      themeMode: theme.isDark.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const AndroidUi(),
    ));
  }
}

var theme = Get.put(ThemeController());
var converter = Get.put(PaltformConverter()); // Fixed typo