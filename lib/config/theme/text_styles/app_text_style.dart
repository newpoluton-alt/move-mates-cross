import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle normal({required double fontSize, required color}) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      );

  static TextStyle medium({required double fontSize, required color}) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle semiBold({required double fontSize, required color}) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bold({required double fontSize, required color}) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle extraBold({required double fontSize, required color}) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
      );
}
