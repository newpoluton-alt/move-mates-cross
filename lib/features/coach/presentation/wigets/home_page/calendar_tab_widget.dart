
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';

class CalendarTabWidget extends StatelessWidget {
  const CalendarTabWidget({
    super.key,
    required this.temp,
    required this.weekDayFormat,
    required this.dayFormat,
  });

  final List<DateTime> temp;
  final DateFormat weekDayFormat;
  final DateFormat dayFormat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: temp
              .map((date) => Container(
            width: 40.w,
            height: 72.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
                color: date.millisecondsSinceEpoch ==
                    DateTime.now().millisecondsSinceEpoch
                    ? CoachColor.calendarBar
                    : Colors.white,
                border:
                Border.all(color: CoachColor.calendarBar),
                borderRadius: BorderRadius.circular(18.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  weekDayFormat.format(date),
                  style: date.millisecondsSinceEpoch == DateTime.now().millisecondsSinceEpoch
                      ? CoachHomeTextStyle.calendarBarCurrent
                      : CoachHomeTextStyle.calendarBarAnother,
                ),
                Text(
                  dayFormat.format(date),
                  style:date.millisecondsSinceEpoch == DateTime.now().millisecondsSinceEpoch
                      ? CoachHomeTextStyle.calendarBarCurrent
                      : CoachHomeTextStyle.calendarBarAnother,
                ),
              ],
            ),
          ))
              .toList(),
        ));
  }
}
