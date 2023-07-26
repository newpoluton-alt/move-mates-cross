import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class CoachHomeTextStyle {
  static TextStyle greeting = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle calendarBarCurrent = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static TextStyle calendarBarAnother = GoogleFonts.montserrat(
    color: CoachColor.calendarBar,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static TextStyle actionBarSelected = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  static TextStyle actionBarUnselected = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
  static TextStyle addNewSchedule = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );
  static TextStyle noTraining = GoogleFonts.montserrat(
    color: ForgottenPasswordPageColor.grey,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
  static TextStyle urlDescription = GoogleFonts.montserrat(
    color: ForgottenPasswordPageColor.grey,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static TextStyle url = GoogleFonts.montserrat(
    color: CoachColor.url,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  static TextStyle fillYourProfileTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
  );
  static TextStyle fillYourProfileContent = GoogleFonts.montserrat(
    color: CoachColor.beginButtonBackground,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static TextStyle beginButton = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
  );
}
