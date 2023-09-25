import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/theme/colors/green_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';
import '../../widgets/training_date_time_set_page/training_date_time_set_page_calendar_widget.dart';
import '../../widgets/training_date_time_set_page/training_date_time_set_page_time_table_widget.dart';

class TrainingDateTimeSetPage extends StatefulWidget {
  final DateTime? Function() obtainDateTime;
  final String? Function() trainingDateTimeValue;
  final void Function(DateTime dateTime) updateDateTime;
  final void Function(String? value) updateTrainingDateTime;

  const TrainingDateTimeSetPage({
    super.key,
    required this.obtainDateTime,
    required this.updateDateTime,
    required this.trainingDateTimeValue,
    required this.updateTrainingDateTime,
  });

  @override
  State<TrainingDateTimeSetPage> createState() =>
      _TrainingDateTimeSetPageState();
}

class _TrainingDateTimeSetPageState extends State<TrainingDateTimeSetPage> {
  int? _selectedHours;

  int? _obtainSelectedHours() => _selectedHours;

  void _updateSelectedHours(int hours) {
    if (hours == _selectedHours) return;
    setState(() {
      _selectedHours = hours;
    });
  }

  late DateTime _selectedDateTime;
  late TimeOfDay _selectedTimeOfDay;

  void _updateSelectedTimeOfDay(TimeOfDay timeOfDay) {
    setState(() {
      _selectedTimeOfDay = timeOfDay;
    });
  }

  void _updateSelectedDateTime(DateTime dateTime) {
    setState(() {
      _selectedDateTime = dateTime;
    });
  }

  DateTime _obtainSelectedDateTime() => _selectedDateTime;

  TimeOfDay _obtainSelectedTimeOfDay() => _selectedTimeOfDay;

  @override
  void initState() {
    _selectedDateTime = widget.obtainDateTime()!;
    _selectedHours = CoachPageConstants.trainingHoursFormats.first;
    _selectedTimeOfDay = TimeOfDay.fromDateTime(widget.obtainDateTime()!);
    super.initState();
  }

  String? _addAndTransformDayTimeToString(int? minute, DateTime dateTime) {
    if (minute == null) return null;
    return TimeOfDay.fromDateTime(dateTime.add(Duration(minutes: minute)))
        .format(context);
  }

  String? _transformDateTimeToString(DateTime dateTime, int? hoursFormat) {
    String? startOfTime = _addAndTransformDayTimeToString(0, dateTime);
    String? endOfTime = _addAndTransformDayTimeToString(hoursFormat, dateTime);
    if (startOfTime == null && endOfTime == null) return null;

    String dayTimeRange = '$startOfTime-$endOfTime';
    return DateFormat('d MMMM, ', 'ru').format(dateTime) + dayTimeRange;
  }

  void _checkObtainedDateTime() {
    if (widget.obtainDateTime() == null) {
      return;
    }

    widget.updateDateTime(_obtainSelectedDateTime().copyWith(
      hour: _selectedTimeOfDay.hour,
      minute: _selectedTimeOfDay.minute,
    ));

    if (_obtainSelectedHours() == null) return;
    if(_isTimeNotChanged()) return;
    widget.updateTrainingDateTime(
      _transformDateTimeToString(
        widget.obtainDateTime()!,
        _obtainSelectedHours(),
      ),
    );

    if (widget.trainingDateTimeValue() == null) return;
    Navigator.of(context).pop();
  }

  bool _isTimeNotChanged() {
    return _obtainSelectedTimeOfDay().hour == TimeOfDay.now().hour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('Дата и время'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrainingDateTimeSetPageCalendarWidget(
              updateSelectedDateTime: _updateSelectedDateTime,
              obtainSelectedDateTime: _obtainSelectedDateTime,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Доступное время',
                    style: AppTextStyle.semiBold(
                      fontSize: 19.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TrainingDateTimeSetPageTimeTableWidget(
                    obtainTrainingHoursFormat: _obtainSelectedHours,
                    updateTrainingHoursFormat: _updateSelectedHours,
                    updateSelectedTimeOfDay: _updateSelectedTimeOfDay,
                    obtainSelectedTimeOfDay: _obtainSelectedTimeOfDay,
                  ),
                  SizedBox(height: 55.h),
                  Center(
                    child: MaterialButton(
                      onPressed: _checkObtainedDateTime,
                      height: 52.h,
                      minWidth: 313.w,
                      color: GreenColor.g2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Text(
                        'Выбрать',
                        style: AppTextStyle.semiBold(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
