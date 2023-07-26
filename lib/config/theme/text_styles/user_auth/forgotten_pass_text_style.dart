import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_mates_android/config/theme/colors.dart';



class ForgottenPasswordTextStyle {
  static TextStyle titleSemiBold = GoogleFonts.montserrat(
    color: ValidationColor.signInAndSignup,
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
  );

  static TextStyle descriptionRegular = GoogleFonts.montserrat(
    color: ValidationColor.signInAndSignup,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );
  static TextStyle descriptionMediumGrey = GoogleFonts.montserrat(
    color: ForgottenPasswordPageColor.grey,
    fontWeight: FontWeight.w500,
    fontSize: 13.sp,
  );
}
