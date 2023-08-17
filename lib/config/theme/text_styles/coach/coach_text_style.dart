import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachTextStyle {
  static TextStyle common({
    required double fontSize,
    required color,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
