import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/theme/app_theme.dart';
import 'package:ibox/features/dashboard/views/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.scaffoldDarkColor,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}