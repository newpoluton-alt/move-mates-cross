import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/grey_color.dart';

class CoachClientsListTextStyle {

  static TextStyle clientsListTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
  );

  static TextStyle clientsListSubTitle = GoogleFonts.montserrat(
    color: GreyColor.g14,
    fontSize: 12.51.sp,
    fontWeight: FontWeight.w400,
  );
}