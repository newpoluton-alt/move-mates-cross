import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

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

  TextStyle get _todayTextStyle =>
      AppTextStyle.normal(fontSize: 21.sp,   color: Colors.white);

  TextStyle get _titleTextStyle =>
      AppTextStyle.bold(fontSize: 18.sp, color: Colors.black);

  TextStyle get _daysOfWeekTextStyle =>
      AppTextStyle.medium(fontSize: 14.sp, color: GreyColor.g14);

  TextStyle get _daysOfMonthTextStyle =>
      AppTextStyle.normal(fontSize: 21.sp, color: Colors.black);

  HeaderStyle get _headerStyle => HeaderStyle(
      formatButtonVisible: false,
      titleTextStyle: _titleTextStyle,
      leftChevronIcon: SignupPageAssetIconWidget(
        path: IconPath.leftChevron,
        size: 18,
        color: PinkColor.p16,
      ),
      rightChevronIcon: SignupPageAssetIconWidget(
        path: IconPath.rightChevron,
        size: 18,
        color: PinkColor.p16,
      ));

  CalendarStyle get _calendarStyle => CalendarStyle(
      outsideDaysVisible: false,
      todayTextStyle: _todayTextStyle,
      defaultTextStyle: _daysOfMonthTextStyle,
      weekendTextStyle: _daysOfMonthTextStyle,
      selectedTextStyle: _daysOfMonthTextStyle,
      selectedDecoration: const BoxDecoration(color: PinkColor.p9),
      todayDecoration: BoxDecoration(
          color: PinkColor.p20, borderRadius: BorderRadius.circular(100.r)));

  DaysOfWeekStyle get _daysOfWeekStyle => DaysOfWeekStyle(
        weekdayStyle: _daysOfWeekTextStyle,
        weekendStyle: _daysOfWeekTextStyle,
      );

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
        headerStyle: _headerStyle,
        calendarStyle: _calendarStyle,
        daysOfWeekStyle: _daysOfWeekStyle,
        selectedDayPredicate: _selectedDayPredicate,
        startingDayOfWeek: StartingDayOfWeek.monday,
        rangeSelectionMode: RangeSelectionMode.enforced,
        weekendDays: const [DateTime.saturday, DateTime.sunday],
        formatAnimationDuration: const Duration(milliseconds: 50),
        firstDay: DateTime(DateTime.now().year, DateTime.now().month),
        lastDay: DateTime(DateTime.now().year, DateTime.now().month + 2, 0),
        // calendarBuilders: CalendarBuilders(defaultBuilder: (context, dateTime1, dateTime2)=>SizedBox()),
      ),
    );
  }
}
