import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/styles/table_calendar_style.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_calendar_text_style.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';

class CalendarPageCoachCalendarWidget extends StatelessWidget {
  final DateTime currentDate;
  final DateTime focusedDate;
  final bool Function(DateTime, DateTime) isDatesSame;
  final void Function(DateTime, DateTime) onChangeCurrentDay;
  final Decoration Function() determineSelectedDateDecoration;
  final List<CoachUpComingContentEntity> upComingEvents;

  const CalendarPageCoachCalendarWidget({
    super.key,
    required this.focusedDate,
    required this.currentDate,
    required this.onChangeCurrentDay,
    required this.determineSelectedDateDecoration,
    required this.upComingEvents,
    required this.isDatesSame,
  });

  List<DateTime> _listOfCurrentEvents(DateTime date) {
    List<DateTime> tempDateTimeList = [];
    for (CoachUpComingContentEntity event in upComingEvents) {
      DateTime parsedDate = DateTime.parse(event.startOfAppointment);
      if (isDatesSame(parsedDate, date)) {
        tempDateTimeList.add(parsedDate);
      }
    }
    return tempDateTimeList;
  }

  String _dayOfWeekFormatter(date, locale) {
    String formattedDate = DateFormat.E(locale).format(date);
    String firstLetter = formattedDate[0].toUpperCase();
    String otherLetters = formattedDate.substring(1).toLowerCase();
    return firstLetter + otherLetters;
  }

  String _headerTitleFormatter(date, locale) {
    String formattedYear = DateFormat.y(locale).format(date);
    String formattedMonth = DateFormat.MMMM(locale).format(date);
    String firstLetter = formattedMonth[0].toUpperCase();
    String otherLetters = formattedMonth.substring(1).toLowerCase();
    String space = ' ';
    return firstLetter + otherLetters + space + formattedYear;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru_RU',
      focusedDay: focusedDate,
      onDaySelected: onChangeCurrentDay,
      selectedDayPredicate: (date) => isDatesSame(focusedDate, date),
      rowHeight: 57.spMin,
      daysOfWeekHeight: 25.h,
      startingDayOfWeek: StartingDayOfWeek.monday,
      //load currentEvents
      eventLoader: _listOfCurrentEvents,
      firstDay: DateTime.utc(currentDate.year, currentDate.month),
      lastDay: DateTime.utc(currentDate.year, currentDate.month + 2, 0),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: CoachCalendarTextStyle.dayOfWeek,
        weekendStyle: CoachCalendarTextStyle.dayOfWeek,
        dowTextFormatter: _dayOfWeekFormatter,
        decoration: const BoxDecoration(
            color: GreyColor.g16,
            border: Border(bottom: BorderSide(color: GreyColor.g15))),
      ),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextFormatter: _headerTitleFormatter,
          leftChevronIcon: SignupPageAssetIconWidget(
            size: 22,
            path: IconPath.leftChevron,
            color: PinkColor.p16,
          ),
          rightChevronIcon: SignupPageAssetIconWidget(
            size: 22,
            path: IconPath.rightChevron,
            color: PinkColor.p16,
          ),
          titleTextStyle: CoachCalendarTextStyle.coachCalendarHeader,
          decoration: const BoxDecoration(color: GreyColor.g16)),
      calendarStyle:
      CalendarStyle(
        markersMaxCount: 1,
        markersAlignment: Alignment.center,
        markersAnchor: 1.45,
        // markerSize: 8.r,
        markerDecoration: BoxDecoration(
            color: GreyColor.g18,
            borderRadius: BorderRadius.circular(100.r)),
        cellAlignment: Alignment.center,
        weekendTextStyle: CoachCalendarTextStyle.coachCalendarDisabled,
        disabledDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        selectedDecoration: determineSelectedDateDecoration(),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100.r),
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: GreyColor.g16,
          borderRadius: BorderRadius.circular(100.r),
        ),
        rowDecoration: const BoxDecoration(
          color: GreyColor.g16,
          border: Border(
            bottom: BorderSide(color: GreyColor.g15),
          ),
        ),
        outsideDaysVisible: false,
        defaultTextStyle: CoachCalendarTextStyle.coachCalendarDefault,
        disabledTextStyle: CoachCalendarTextStyle.coachCalendarDisabled,
        selectedTextStyle: CoachCalendarTextStyle.coachCalendarFocused,
        todayTextStyle: CoachCalendarTextStyle.coachCalendarToday,
      ),
    );
  }
}
