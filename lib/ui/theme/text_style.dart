import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle greeting = GoogleFonts.montserrat(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26.sp);
  static TextStyle concernName = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 48.sp,
  );
  static TextStyle regularWhite =
      GoogleFonts.montserrat(color: Colors.white, fontSize: 15.sp);
  static TextStyle regularFunctionalWhite = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600);
}

class AppButtonTextStyle {
  static TextStyle regularButtonWhite = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle regularButtonBlack = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700);
}
