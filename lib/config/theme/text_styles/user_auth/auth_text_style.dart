
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class ValidationTextStyle {
  static TextStyle textFieldError =
  GoogleFonts.montserrat(fontSize: 10.sp, fontWeight: FontWeight.w500);
  static TextStyle signupRegular = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14.sp,
  );
  static TextStyle signupSemiBold = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600);

  static TextStyle checkBoxMedium = GoogleFonts.montserrat(
      color: ValidationColor.signInAndSignup,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static TextStyle checkBoxMediumGrey = GoogleFonts.montserrat(
      color: ValidationColor.checkBoxGrey,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static TextStyle toolBarRegularSemiBold = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600);
  static TextStyle toolBarRegularSemiBoldSelected = GoogleFonts.montserrat(
      color: ValidationColor.pageMainColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600);

  static TextStyle textFieldUp = GoogleFonts.montserrat(
      color: ValidationColor.signInAndSignup,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600);

  static TextStyle appBar = GoogleFonts.montserrat(
      color: ValidationColor.signInAndSignup,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600);

  static TextStyle medium = GoogleFonts.montserrat(
      color: ValidationColor.signInAndSignup,
      fontSize: 26.sp,
      fontWeight: FontWeight.w600);

  static TextStyle regular = GoogleFonts.montserrat(
    color: ValidationColor.signInAndSignup,
    fontSize: 14.sp,
  );
  static TextStyle loginSemiBold = GoogleFonts.montserrat(
    color: ValidationColor.signInAndSignup,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
}
