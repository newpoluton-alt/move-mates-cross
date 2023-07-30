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
    required this.dMYFormat,
  });

  final List<DateTime> temp;
  final DateFormat weekDayFormat;
  final DateFormat dayFormat;
  final DateFormat dMYFormat;

  bool isTheDatesSame(DateTime date) =>
      dMYFormat.format(date) == dMYFormat.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: temp.map((date) {
            return Container(
              width: 40.w,
              height: 72.w,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  color: isTheDatesSame(date)
                      ? CoachColor.calendarBar
                      : Colors.white,
                  border: Border.all(color: CoachColor.calendarBar),
                  borderRadius: BorderRadius.circular(18.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    weekDayFormat.format(date),
                    style: isTheDatesSame(date)
                        ? CoachHomeTextStyle.calendarBarCurrent
                        : CoachHomeTextStyle.calendarBarAnother,
                  ),
                  Text(
                    dayFormat.format(date),
                    style: isTheDatesSame(date)
                        ? CoachHomeTextStyle.calendarBarCurrent
                        : CoachHomeTextStyle.calendarBarAnother,
                  ),
                ],
              ),
            );
          }).toList(),
        ));
  }
}
