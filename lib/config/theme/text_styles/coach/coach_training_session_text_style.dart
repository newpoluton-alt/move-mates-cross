import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_mates_android/config/theme/colors.dart';

class CoachTrainingSessionTextStyle {
  static TextStyle backButtonText = GoogleFonts.montserrat(
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      color: AppViewColor.indicatorSelected);

  static TextStyle trainingSessionButton = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle workingHoursTitle = GoogleFonts.montserrat(
    color: CoachColor.workingHoursTitle,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,);
}
