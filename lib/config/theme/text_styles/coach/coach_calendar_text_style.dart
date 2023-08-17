import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';

import '../../colors/pink_color.dart';

class CoachCalendarTextStyle {
  static TextStyle calendarEventWidgetSubtitle = GoogleFonts.montserrat(
    color: GreyColor.g1,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
  );
  static TextStyle calendarEventWidgetTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 17.sp,
  );
  static TextStyle calendarEventWidgetTimeTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
  );
  static TextStyle calendarEventWidgetTimeSubtitle = GoogleFonts.montserrat(
    color: GreyColor.g1,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
  );
  static TextStyle calendarAddTrainingTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
  );

  static TextStyle coachCalendarHeader = GoogleFonts.montserrat(
    color: PinkColor.p16,
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle coachCalendarDefault = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle coachCalendarFocused = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle coachCalendarDisabled = GoogleFonts.montserrat(
    color: GreyColor.g17,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle coachCalendarToday = GoogleFonts.montserrat(
    color: PinkColor.p14,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle dayOfWeek = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
  );
}