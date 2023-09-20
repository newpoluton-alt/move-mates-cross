import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/styles/table_calendar_style.dart';
import 'package:table_calendar/table_calendar.dart';

class AboutTrainingPageBottomSheetModalCalendarWidget extends StatefulWidget {
  final DateTime startOfAppointmentDate;
  final void Function(DateTime postponingDateTime) rescheduleAppointmentDate;

  const AboutTrainingPageBottomSheetModalCalendarWidget({
    super.key,
    required this.startOfAppointmentDate,
    required this.rescheduleAppointmentDate,
  });

  @override
  State<AboutTrainingPageBottomSheetModalCalendarWidget> createState() =>
      _AboutTrainingPageBottomSheetModalCalendarWidgetState();
}

class _AboutTrainingPageBottomSheetModalCalendarWidgetState
    extends State<AboutTrainingPageBottomSheetModalCalendarWidget> {
  late DateTime _focusedDay;

  @override
  void initState() {
    _focusedDay = DateTime.now();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TableCalendar(
        locale: 'ru',
        rowHeight: 47.r,
        focusedDay: _focusedDay,
        onDaySelected: (curr, focus) {
          setState(() {
            _focusedDay = focus;
          });
          widget.rescheduleAppointmentDate(focus);
        },

        headerStyle: TableCalendarStyle.headerStyle,
        calendarStyle: TableCalendarStyle.calendarStyle,
        daysOfWeekStyle: TableCalendarStyle.daysOfWeekStyle,
        currentDay: widget.startOfAppointmentDate,
        startingDayOfWeek: StartingDayOfWeek.monday,
        weekendDays: const [DateTime.saturday, DateTime.sunday],
        formatAnimationDuration: const Duration(milliseconds: 50),
        firstDay: DateTime(DateTime.now().year, DateTime.now().month),
        lastDay: DateTime(DateTime.now().year, DateTime.now().month + 2, 0),
      ),
    );
  }
}
