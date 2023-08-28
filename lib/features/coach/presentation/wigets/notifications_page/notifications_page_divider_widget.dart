

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';

class NotificationsPageDividerWidget extends StatelessWidget {
  const NotificationsPageDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 1.h,
      decoration: const BoxDecoration(color: GreyColor.g19),
    );
  }
}
