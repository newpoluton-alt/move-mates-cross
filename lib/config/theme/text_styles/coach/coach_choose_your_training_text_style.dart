import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';

class CoachTrainingSessionTextStyle {
  static TextStyle backButtonText = GoogleFonts.montserrat(
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      color: PinkColor.p3);

  static TextStyle trainingSessionButton = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle workingHoursTitle = GoogleFonts.montserrat(
    color: GreyColor.g9,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500);

  static TextStyle trainingTypeDropdownItemTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400);
  static TextStyle dropdownTextFieldSubtitle = GoogleFonts.montserrat(
    color: GreyColor.g21,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500);
  static TextStyle dropdownTextFieldSubtitleError = GoogleFonts.montserrat(
    color: PinkColor.p15,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500);
  static TextStyle appBarDoneButtonTitle = GoogleFonts.montserrat(
    color: PinkColor.p15,
    fontSize: 17.sp,
    fontWeight: FontWeight.w500);
  static TextStyle dropdownTextFieldLabel = GoogleFonts.montserrat(
    color: GreyColor.g22,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400);
}
