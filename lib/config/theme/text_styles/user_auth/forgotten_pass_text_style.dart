import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';

import '../../colors/green_color.dart';



class ForgottenPasswordTextStyle {
  static TextStyle titleSemiBold = GoogleFonts.montserrat(
    color: GreenColor.g1,
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
  );

  static TextStyle descriptionRegular = GoogleFonts.montserrat(
    color: GreenColor.g1,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );
  static TextStyle descriptionMediumGrey = GoogleFonts.montserrat(
    color: GreyColor.g1,
    fontWeight: FontWeight.w500,
    fontSize: 13.sp,
  );
}
