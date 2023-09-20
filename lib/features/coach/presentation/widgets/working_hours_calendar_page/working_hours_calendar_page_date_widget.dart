
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/blue_color.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'working_hours_calendar_page_time_container_widget.dart';

class WorkingHoursCalendarPageDateWidget extends StatefulWidget {
  final DateTime dateTime;
  final void Function(DateTime dateTime) removeDateTime;

  const WorkingHoursCalendarPageDateWidget({
    super.key,
    required this.dateTime,
    required this.removeDateTime,
  });

  @override
  State<WorkingHoursCalendarPageDateWidget> createState() =>
      _WorkingHoursCalendarPageDateWidgetState();
}

class _WorkingHoursCalendarPageDateWidgetState
    extends State<WorkingHoursCalendarPageDateWidget> {
  late bool _isAllDay;
  late TimeOfDay _leftTimeOfDay;
  late TimeOfDay _rightTimeOfDay;

  @override
  void initState() {
    _isAllDay = false;
    _leftTimeOfDay = const TimeOfDay(hour: 0, minute: 0);
    _rightTimeOfDay = const TimeOfDay(hour: 0, minute: 0);
    super.initState();
  }

  void _changeAllDayValue(bool value) {
    setState(() {
      _isAllDay = value;
    });
  }

  void _changeLeftTimeOfDay(TimeOfDay timeOfDay) {
    setState(() {
      _leftTimeOfDay = timeOfDay;
    });
  }

  void _changeRightTimeOfDay(TimeOfDay timeOfDay) {
    setState(() {
      _rightTimeOfDay = timeOfDay;
    });
  }

  String get _dayMonthCommaWeek =>
      DateFormat('d MMMM, EE', 'ru').format(widget.dateTime);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15.w),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: GreyColor.g19),
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _dayMonthCommaWeek,
                style:
                AppTextStyle.normal(fontSize: 18.sp, color: Colors.black),
              ),
              IconButton(
                  onPressed: () {
                    widget.removeDateTime(widget.dateTime);
                  },
                  icon: SignupPageAssetIconWidget(
                    path: IconPath.trash,
                  ))
            ],
          ),
        ),
        SizedBox(height: 10.h),
        (_isAllDay)
            ? const SizedBox()
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WorkingHoursCalendarPageTimeContainerWidget(
              timeOfDay: _leftTimeOfDay,
              changeTimeOfDay: _changeLeftTimeOfDay,
            ),
            Container(
              width: 10.w,
              height: 1.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: const BoxDecoration(color: Colors.black),
            ),
            WorkingHoursCalendarPageTimeContainerWidget(
              timeOfDay: _rightTimeOfDay,
              changeTimeOfDay: _changeRightTimeOfDay,
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                value: _isAllDay,
                activeColor: BlueColor.b4,
                onChanged: (value) => _changeAllDayValue(value ?? false)),
            Text(
              'Весь день',
              style: AppTextStyle.normal(
                fontSize: 15.sp,
                color: _isAllDay ? GreyColor.g34 : GreyColor.g35,
              ),
            )
          ],
        )
      ],
    );
  }
}
