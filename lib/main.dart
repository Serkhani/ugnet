import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugnet/helpers/theme_info.dart';
import 'package:ugnet/pages/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      // themeMode: ThemeMode.dark,
      themeMode: ThemeMode.light,
      theme: ThemeInfo().lightTheme.data,
      darkTheme: ThemeInfo().darkTheme.data,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage()
    );
  }
}

