import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibox/config/theme/app_colors.dart';

class AppTheme {

  static var themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    useMaterial3: false,
    canvasColor: AppColors.scaffoldDarkColor,
    brightness: Brightness.dark,
    dividerColor: Colors.grey.shade200.withOpacity(0.6),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}