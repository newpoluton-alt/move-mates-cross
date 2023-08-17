import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/grey_color.dart';
import '../../colors/pink_color.dart';

class CoachHomeTextStyle {
  static TextStyle greeting = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle clientNameTrainingCard = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 18.19.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle trainingCardBeginSession = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitleTrainingCard = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle calendarBarCurrent = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static TextStyle connectionState = GoogleFonts.montserrat(
    color: PinkColor.p10,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle trainingTime = GoogleFonts.montserrat(
    color: PinkColor.p10,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle calendarBarAnother = GoogleFonts.montserrat(
    color: PinkColor.p5,
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
    color: GreyColor.g1,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
  static TextStyle urlDescription = GoogleFonts.montserrat(
    color: GreyColor.g1,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static TextStyle url = GoogleFonts.montserrat(
    color: GreyColor.g6,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  static TextStyle fillYourProfileTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
  );
  static TextStyle fillYourProfileContent = GoogleFonts.montserrat(
    color: GreyColor.g7,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static TextStyle beginButton = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
  );

}
