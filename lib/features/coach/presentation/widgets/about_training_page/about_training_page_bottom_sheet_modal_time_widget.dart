import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/app_text_style.dart';

class AboutTrainingPageBottomSheetModalTimeWidget extends StatelessWidget {
  final DateTime date;
  final void Function(TimeOfDay time) rescheduleTime;

  const AboutTrainingPageBottomSheetModalTimeWidget({
    super.key,
    required this.date,
    required this.rescheduleTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      height: 34.h,
      margin: EdgeInsets.only(
        right: 4.w,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          onTap: () {
            rescheduleTime(TimeOfDay.fromDateTime(date));
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              TimeOfDay.fromDateTime(date).format(context),
              style: AppTextStyle.normal(
                fontSize: 17.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
