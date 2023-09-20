
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class WorkingHoursCalendarPageTimeContainerWidget extends StatelessWidget {
  final TimeOfDay timeOfDay;
  final void Function(TimeOfDay timeOfDay) changeTimeOfDay;

  const WorkingHoursCalendarPageTimeContainerWidget({
    super.key,
    required this.timeOfDay,
    required this.changeTimeOfDay,
  });

  void _showWorkingHoursTimePicker(BuildContext context) async {
    TimeOfDay? time =
    await showTimePicker(context: context, initialTime: timeOfDay);
    if (time != null) {
      changeTimeOfDay(time);
    }
  }

  bool _isTimeChanged() {
    bool isMinuteChanged = timeOfDay.minute != 0;
    bool isHourChanged = timeOfDay.hour != 0;
    return (isMinuteChanged || isHourChanged);
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        onTap: () {
          _showWorkingHoursTimePicker(context);
          setState(() {});
        },
        child: Container(
          height: 50.h,
          width: 113.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: GreyColor.g32),
          ),
          child: Center(
            child: Text(
              timeOfDay.format(context),
              style: AppTextStyle.normal(
                fontSize: 18.sp,
                color: _isTimeChanged() ? Colors.black : GreyColor.g22,
              ),
            ),
          ),
        ),
      );
    });
  }
}
