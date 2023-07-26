import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class AppTextStyle {
  static TextStyle greeting = GoogleFonts.montserrat(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26.sp);

  static TextStyle appSplashStyle = GoogleFonts.openSans(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: 37.sp);

  static TextStyle concernName = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 48.sp,
  );
  static TextStyle appBar = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.w600);

  static TextStyle regularWhite =
  GoogleFonts.montserrat(color: Colors.white, fontSize: 15.sp);

  static TextStyle regularFunctionalWhite = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600);
  static TextStyle appViewBoldBlack = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 27.sp, fontWeight: FontWeight.w600);
  static TextStyle appViewRegularBlack =
  GoogleFonts.montserrat(color: Colors.black, fontSize: 20.sp);
}

class AppButtonTextStyle {
  static TextStyle regularButtonWhite = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w700);

  static TextStyle regularButtonBlack = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700);
  static TextStyle regularButtonPink = GoogleFonts.montserrat(
      color: ValidationColor.pageMainColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700);
  static TextStyle regularButtonBlackMedium = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600);
}

