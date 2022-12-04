import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/screen/home_page.dart';
import 'package:task_management/screen/project_page.dart';
import 'package:task_management/screen/splash_page.dart';
import 'package:task_management/screen/tabbar_view.dart';
import 'package:task_management/screen/teammember_page.dart';
import 'package:task_management/utls/colors.dart';

import 'model_class/pagelist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kBackground // status bar color
        ));

    return MaterialApp(
      // checkerboardOffscreenLayers: true,
      // checkerboardRasterCacheImages: false,
      // highContrastDarkTheme: true,
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: kBackground),
      home: SplashPage(),
    );
  }
}
