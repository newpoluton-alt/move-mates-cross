
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/grey_color.dart';
import '../../colors/green_color.dart';
import '../../colors/pink_color.dart';

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
      color: GreenColor.g1,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static TextStyle checkBoxMediumGrey = GoogleFonts.montserrat(
      color: GreyColor.g2,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static TextStyle toolBarRegularSemiBold = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600);
  static TextStyle toolBarRegularSemiBoldSelected = GoogleFonts.montserrat(
      color: PinkColor.p4,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600);

  static TextStyle textFieldUp = GoogleFonts.montserrat(
      color: GreenColor.g1,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600);

  static TextStyle appBar = GoogleFonts.montserrat(
      color: GreenColor.g1,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600);

  static TextStyle medium = GoogleFonts.montserrat(
      color: GreenColor.g1,
      fontSize: 26.sp,
      fontWeight: FontWeight.w600);

  static TextStyle regular = GoogleFonts.montserrat(
    color: GreenColor.g1,
    fontSize: 14.sp,
  );
  static TextStyle loginSemiBold = GoogleFonts.montserrat(
    color: GreenColor.g1,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
}
