
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/styles/table_calendar_style.dart';

class TrainingDateTimeSetPageCalendarWidget extends StatelessWidget {
  final DateTime? Function() obtainSelectedDateTime;
  final void Function(DateTime dateTime) updateSelectedDateTime;

  const TrainingDateTimeSetPageCalendarWidget({
    super.key,
    required this.updateSelectedDateTime,
    required this.obtainSelectedDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(color: GreyColor.g33),
                  top: BorderSide(color: GreyColor.g25))),
          child: TableCalendar(
            locale: 'ru',
            daysOfWeekHeight: 20.sp,
            rowHeight: 57.spMin,
            focusedDay: obtainSelectedDateTime()!,
            onDaySelected: (curr, focus) {
              setState((){});
              updateSelectedDateTime(focus);
            },
            headerStyle: TableCalendarStyle.headerStyle,
            calendarStyle: TableCalendarStyle.calendarStyle,
            daysOfWeekStyle: TableCalendarStyle.daysOfWeekStyle,
            currentDay: obtainSelectedDateTime(),
            startingDayOfWeek: StartingDayOfWeek.monday,
            weekendDays: const [DateTime.saturday, DateTime.sunday],
            formatAnimationDuration: const Duration(milliseconds: 50),
            firstDay: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            lastDay: DateTime(DateTime.now().year, DateTime.now().month + 2, 0),
          ),
        );
      }
    );
  }
}
