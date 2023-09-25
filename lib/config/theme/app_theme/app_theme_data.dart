import 'package:flutter/material.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';

import '../colors/blue_color.dart';
import '../colors/green_color.dart';
import '../colors/pink_color.dart';
import '../text_styles/user_auth/main_text_style.dart';
import '../text_styles/user_auth/auth_text_style.dart';

class AppThemeData {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: PinkColor.p7,
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    labelStyle: ValidationTextStyle.textFieldUp,
    outlineBorder: const BorderSide(color: Colors.grey),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: GreyColor.g3),
    ),
  );

  static const TextSelectionThemeData textSelectionTheme =
      TextSelectionThemeData(
    cursorColor: BlueColor.b1,
  );

  static const BottomSheetThemeData bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    titleTextStyle: MMTextStyle.appBar,
    backgroundColor: Colors.white,
    foregroundColor: GreenColor.g1,
    elevation: 0,
  );

  static const BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    selectedItemColor: PinkColor.p7,
  );

}
