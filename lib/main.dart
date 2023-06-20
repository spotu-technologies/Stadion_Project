import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/login/start_view.dart';
import 'package:stadion_project/view/splash/splash_first_view.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // test text for test commit
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        minWidth: 750,
        minWidthLandscape: 1624.0,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.autoScale(750, name: MOBILE),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ],
        breakpointsLandscape: [],
        child!,
      ),
      title: 'Stadion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: colorScheme),
      home: SplashFirstView(),
    );
  }
}

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // test text for test commit
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        minWidth: 750,
        minWidthLandscape: 1624.0,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.autoScale(750, name: MOBILE),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ],
        breakpointsLandscape: [],
        child!,
      ),
      title: 'Stadion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: colorScheme),
      home: StartView(),
    );
  }
}*/
