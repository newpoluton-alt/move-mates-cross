import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';
import '../../routes/assets_routes.dart';
import '../colors/grey_color.dart';
import '../colors/pink_color.dart';
import '../text_styles/app_text_style.dart';

class TableCalendarStyle {
  static TextStyle get _todayTextStyle =>
      AppTextStyle.normal(fontSize: 21.sp, color: Colors.white);

  static TextStyle get _titleTextStyle =>
      AppTextStyle.bold(fontSize: 18.sp, color: Colors.black);

  static TextStyle get _daysOfWeekTextStyle =>
      AppTextStyle.medium(fontSize: 14.sp, color: GreyColor.g14);

  static TextStyle get _daysOfMonthTextStyle =>
      AppTextStyle.normal(fontSize: 21.sp, color: Colors.black);

  static HeaderStyle get headerStyle => HeaderStyle(
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

  static CalendarStyle get calendarStyle => CalendarStyle(
        outsideDaysVisible: false,
        todayTextStyle: _todayTextStyle,
        disabledTextStyle: _daysOfMonthTextStyle,
        defaultTextStyle: _daysOfMonthTextStyle,
        weekendTextStyle: _daysOfMonthTextStyle,
        selectedTextStyle: _daysOfMonthTextStyle,
        selectedDecoration: BoxDecoration(
          color: PinkColor.p9,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
        ),
        defaultDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        disabledDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        todayDecoration: BoxDecoration(
          color: PinkColor.p20,
          borderRadius: BorderRadius.circular(100.r),
          shape: BoxShape.rectangle,
        ),
      );

  static DaysOfWeekStyle get daysOfWeekStyle => DaysOfWeekStyle(
        weekdayStyle: _daysOfWeekTextStyle,
        weekendStyle: _daysOfWeekTextStyle,
      );
}
