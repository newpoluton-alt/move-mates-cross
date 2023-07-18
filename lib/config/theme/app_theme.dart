import 'package:flutter/material.dart';
import 'package:move_mates_android/config/theme/text_field_styles.dart';
import 'package:move_mates_android/config/theme/text_style.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get moveMatesTheme => ThemeData(
      useMaterial3: true,
      dialogBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: ValidationPageTextStyle.textFieldUp,
          focusedBorder: ValidationTextFieldStyles.underLineFocusedBorder),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ValidationColor.indicatorColor),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent, elevation: 0),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTextStyle.appBar,
        backgroundColor: Colors.white,
        foregroundColor: ValidationColor.signInAndSignup,
        elevation: 0,
        // backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: UserPageColor.icon,
      ));
}
