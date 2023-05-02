import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/login/start_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        minWidth: 750,
        minWidthLandscape: 1624.0,
        defaultScale: true,
        breakpoints: [],
        breakpointsLandscape: [],
        child!,
      ),
      title: 'Stadion',
      theme: ThemeData.from(colorScheme: colorScheme),
      home: StartView(),
    );
  }
}
