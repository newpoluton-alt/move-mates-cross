import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import 'about_training_page_bottom_sheet_modal_calendar_widget.dart';
import 'about_training_page_bottom_sheet_modal_time_change_widget.dart';

class AboutTrainingPagePostponeAppointmentWidget extends StatefulWidget {
  final void Function(DateTime date) refreshSelectedDate;
  final void Function(TimeOfDay time) refreshSelectedTime;
  final CoachUpComingContentEntity coachUpComingContentEntity;

  const AboutTrainingPagePostponeAppointmentWidget({
    super.key,
    required this.refreshSelectedDate,
    required this.refreshSelectedTime,
    required this.coachUpComingContentEntity,
  });

  @override
  State<AboutTrainingPagePostponeAppointmentWidget> createState() =>
      _AboutTrainingPagePostponeAppointmentWidgetState();
}

class _AboutTrainingPagePostponeAppointmentWidgetState
    extends State<AboutTrainingPagePostponeAppointmentWidget> {
  late bool _showCalendar;
  late bool _showTimeTable;
  late DateFormat _customDateFormat;
  late DateTime _startOfAppointmentTime;
  late DateTime _startOfAppointmentDate;

  @override
  void initState() {
    _showCalendar = true;
    _showTimeTable = true;
    _customDateFormat = DateFormat('d MMMM yyyy', 'ru');
    _startOfAppointmentTime = _parsedDate(
      widget.coachUpComingContentEntity.startOfAppointment,
    );
    _startOfAppointmentDate = _parsedDate(
      widget.coachUpComingContentEntity.startOfAppointment,
    );
    super.initState();
  }

  void _changeTimeTableVisibility() {
    setState(() {
      _showTimeTable = !_showTimeTable;
    });
  }

  void _rescheduleAppointmentDate(DateTime dateTime) {
    widget.refreshSelectedDate(dateTime);
    setState(() {
      _startOfAppointmentDate = dateTime;
    });
  }

  void _rescheduleAppointmentTime(TimeOfDay time) {
      _startOfAppointmentTime = _startOfAppointmentTime.copyWith(
        hour: time.hour,
        minute: time.minute,
    );
    widget.refreshSelectedTime(time);
  }
  TextStyle get _rowDataTextStyle => AppTextStyle.normal(
        fontSize: 17.sp,
        color: Colors.black,
      );

  void _changeCalendarVisibility() {
    setState(() {
      _showCalendar = !_showCalendar;
    });
  }

  DateTime _parsedDate(String time) => DateTime.parse(time);

  Widget _rowDataWidget(String data) => Container(
        height: 34.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: GreyColor.g12.withOpacity(0.24),
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        child: FittedBox(
          child: Text(
            data,
            style: _rowDataTextStyle,
          ),
        ),
      );

  Widget _aboutTrainingPageDividerWidget() {
    return Container(
      height: 1.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: GreyColor.g13.withOpacity(0.36),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w, top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Начало',
                    style: _rowDataTextStyle,
                  ),
                  const Expanded(child: SizedBox()),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: _changeCalendarVisibility,
                      child: _rowDataWidget(
                        _customDateFormat.format(_startOfAppointmentDate),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: _changeTimeTableVisibility,
                      child: _rowDataWidget(
                        TimeOfDay.fromDateTime(_startOfAppointmentTime)
                            .format(context),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              SizedBox(height: 5.h),
              _aboutTrainingPageDividerWidget(),
              !_showCalendar
                  ? const SizedBox()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AboutTrainingPageBottomSheetModalCalendarWidget(
                          startOfAppointmentDate: _startOfAppointmentDate,
                          rescheduleAppointmentDate: _rescheduleAppointmentDate,
                        ),
                        SizedBox(height: 29.h),
                        _aboutTrainingPageDividerWidget(),
                        SizedBox(height: 5.h),
                      ],
                    ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    'Конец',
                    style: _rowDataTextStyle,
                  ),
                  const Expanded(child: SizedBox()),
                  _rowDataWidget(
                    _customDateFormat.format(_startOfAppointmentDate),
                  ),
                  SizedBox(width: 3.w),
                  _rowDataWidget(
                    TimeOfDay.fromDateTime(
                      _startOfAppointmentTime.add(
                        const Duration(
                          minutes: 60,
                        ),
                      ),
                    ).format(context),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        !_showTimeTable
            ? const SizedBox()
            : AboutTrainingPageBottomSheetModalTimeChangeWidget(
                rescheduleTime: _rescheduleAppointmentTime,
                coachUpComingContentEntity: widget.coachUpComingContentEntity,
              ),
      ],
    );
  }
}
