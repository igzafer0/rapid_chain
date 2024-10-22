import 'package:flutter/material.dart';
import 'package:rapid_chain/config/navigation/navigation_route.dart';
import 'package:rapid_chain/config/theme/dark/app_theme_dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rapid Chain',
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.instance.theme,
      routerConfig: router,
    );
  }
}
