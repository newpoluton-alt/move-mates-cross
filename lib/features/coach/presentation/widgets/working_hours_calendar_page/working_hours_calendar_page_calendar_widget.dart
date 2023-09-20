import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/styles/table_calendar_style.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../config/theme/colors/grey_color.dart';

class WorkingHoursCalendarPageCalendarWidget extends StatefulWidget {
  final List<DateTime> selectedDateTimes;
  final void Function(DateTime dateTime) addDateTime;
  final void Function(DateTime dateTime) removeDateTime;
  final bool Function(DateTime dateOne, DateTime dateTwo) isDatesSame;

  const WorkingHoursCalendarPageCalendarWidget({
    super.key,
    required this.isDatesSame,
    required this.addDateTime,
    required this.removeDateTime,
    required this.selectedDateTimes,
  });

  @override
  State<WorkingHoursCalendarPageCalendarWidget> createState() =>
      _WorkingHoursCalendarPageCalendarWidgetState();
}

class _WorkingHoursCalendarPageCalendarWidgetState
    extends State<WorkingHoursCalendarPageCalendarWidget> {
  late DateTime _focusedDay;

  @override
  void initState() {
    _focusedDay = DateTime.now();
    super.initState();
  }

  bool _selectedDayPredicate(DateTime dateTime) {
    return widget.selectedDateTimes.any((element) =>
        widget.isDatesSame(element, dateTime) &&
        !widget.isDatesSame(element, DateTime.now()));
  }

  bool _isDateContained(DateTime dateTime) {
    return widget.selectedDateTimes
        .any((element) => widget.isDatesSame(element, dateTime));
  }

  void _changeFocusedDay(DateTime dateTime) {
    setState(() {
      _focusedDay = dateTime;
    });
  }

  void _addOrRemoveDate(DateTime dateTime) {
    if (_isDateContained(dateTime)) {
      widget.removeDateTime(dateTime);
    } else {
      widget.addDateTime(dateTime);
    }
    _changeFocusedDay(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: GreyColor.g33))),
      child: TableCalendar(
        currentDay: DateTime.now(),
        locale: 'ru',
        onDaySelected: (curr, focus) {
          _addOrRemoveDate(curr);
          setState(() {});
        },
        rowHeight: 55.r,
        focusedDay: _focusedDay,
        selectedDayPredicate: _selectedDayPredicate,
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: TableCalendarStyle.headerStyle,
        calendarStyle: TableCalendarStyle.calendarStyle,
        daysOfWeekStyle: TableCalendarStyle.daysOfWeekStyle,
        weekendDays: const [DateTime.saturday, DateTime.sunday],
        formatAnimationDuration: const Duration(milliseconds: 50),
        firstDay: DateTime(DateTime.now().year, DateTime.now().month),
        lastDay: DateTime(DateTime.now().year, DateTime.now().month + 2, 0),
        // calendarBuilders: CalendarBuilders(defaultBuilder: (context, dateTime1, dateTime2)=>SizedBox()),
      ),
    );
  }
}
