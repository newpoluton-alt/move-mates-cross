import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../../core/constants/coach/coach_page_constants.dart';

class TrainingDateTimeSetPageTimeTableWidget extends StatefulWidget {
  final int? Function() obtainTrainingHoursFormat;
  final TimeOfDay Function() obtainSelectedTimeOfDay;
  final void Function(int value) updateTrainingHoursFormat;
  final void Function(TimeOfDay timeOfDay) updateSelectedTimeOfDay;

  const TrainingDateTimeSetPageTimeTableWidget({
    super.key,
    required this.obtainSelectedTimeOfDay,
    required this.updateSelectedTimeOfDay,
    required this.obtainTrainingHoursFormat,
    required this.updateTrainingHoursFormat,
  });

  @override
  State<TrainingDateTimeSetPageTimeTableWidget> createState() => _TrainingDateTimeSetPageTimeTableWidgetState();
}

class _TrainingDateTimeSetPageTimeTableWidgetState extends State<TrainingDateTimeSetPageTimeTableWidget> {
  late TimeOfDay _localSelectedTimeOfDay;

  List<TimeOfDay> get _timesOfDay => List<TimeOfDay>.generate(
        11,
        (index) => TimeOfDay.fromDateTime(
          DateTime.now().copyWith(minute: 0).add(
                Duration(hours: index + 1, minutes: 0),
              ),
        ),
      );

  bool _isTimeTheSame(TimeOfDay timeOfDay) {
    bool isHoursSame = _localSelectedTimeOfDay.hour == timeOfDay.hour;
    bool isMinutesSame = _localSelectedTimeOfDay.minute == timeOfDay.minute;
    return isHoursSame && isMinutesSame;
  }

  void _updateLocalTimeOfDay(TimeOfDay timeOfDay) {
    setState(() {
      _localSelectedTimeOfDay = timeOfDay;
    });
  }
  void _onTapTimeTile(int hourFormat, TimeOfDay hour) {

    widget.updateTrainingHoursFormat(hourFormat);
    widget.updateSelectedTimeOfDay(hour);
    _updateLocalTimeOfDay(hour);
  }
  @override
  void initState() {
    _localSelectedTimeOfDay =  widget.obtainSelectedTimeOfDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 21.w,
      runSpacing: 10.h,
      children: _timesOfDay
          .map(
            (hour) => DropdownButton(
              underline: const SizedBox(),
              icon: const SizedBox(),
              borderRadius: BorderRadius.circular(8.r),
              items: CoachPageConstants.trainingHoursFormats
                  .map((hourFormat) => DropdownMenuItem(
                      value: hourFormat,
                      onTap: () {
                        _onTapTimeTile(hourFormat, hour);
                      },
                      child: Text(
                        '$hourFormat минут',
                        style: AppTextStyle.normal(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      )))
                  .toList(),
              onChanged: (value) {},
              hint: Container(
                height: 43.h,
                width: 102.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: _isTimeTheSame(hour) ? PinkColor.p16 : Colors.white),
                child: Text(
                  hour.format(context),
                  style: AppTextStyle.medium(
                      fontSize: 19.sp,
                      color:
                          _isTimeTheSame(hour) ? Colors.white : Colors.black),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
