import 'package:flutter/material.dart';
import 'package:move_mates_android/config/theme/app_theme/app_theme_data.dart';

class AppTheme {
  static ThemeData get moveMatesTheme =>
      ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          appBarTheme: AppThemeData.appBarTheme,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: AppThemeData.colorScheme,
          bottomSheetTheme: AppThemeData.bottomSheetThemeData,
          textSelectionTheme: AppThemeData.textSelectionTheme,
          inputDecorationTheme: AppThemeData.inputDecorationTheme,
          bottomNavigationBarTheme:AppThemeData.bottomNavigationBarThemeData);
}

