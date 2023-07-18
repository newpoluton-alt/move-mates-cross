import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_mates_android/config/theme/colors.dart';

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
  static TextStyle regularButtonBlackMedium = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600);
}

class ValidationPageTextStyle {
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
      color: ValidationColor.indicatorColor,
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

class ForgottenPasswordPageTextStyle{
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


class UserPageTextStyle{

  static TextStyle bottomNavigationBar = GoogleFonts.montserrat(
    color: UserPageColor.icon,
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
  );
}