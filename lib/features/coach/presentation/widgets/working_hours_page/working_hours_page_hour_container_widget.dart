import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class WorkingHoursPageHourContainerWidget extends StatefulWidget {
  final TimeOfDay timeOfDay;
  final bool isBreakContainer;
  final void Function({
    required TimeOfDay selectedTimeOfDay,
  }) refreshTimeOfDay;

  final bool Function()? isDayChecked;

  const WorkingHoursPageHourContainerWidget({
    super.key,
    this.isDayChecked,
    required this.timeOfDay,
    required this.isBreakContainer,
    required this.refreshTimeOfDay,
  });

  @override
  State<WorkingHoursPageHourContainerWidget> createState() =>
      _WorkingHoursPageHourContainerWidgetState();
}

class _WorkingHoursPageHourContainerWidgetState
    extends State<WorkingHoursPageHourContainerWidget> {
  void _displayTimePicker(BuildContext context) async {
    var selectedTime = await showTimePicker(
      context: context,
      initialTime: widget.timeOfDay,
    );
    if (selectedTime != null) {
      widget.refreshTimeOfDay(selectedTimeOfDay: selectedTime);
    }
  }

  bool _isTimeChanged() {
    return widget.timeOfDay.hour != 0 || widget.timeOfDay.minute != 0;
  }

  void _showTimePicker() {
    if (widget.isBreakContainer)_displayTimePicker(context);
    if (widget.isDayChecked == null) return;
    if (!widget.isDayChecked!()) return;
    _displayTimePicker(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showTimePicker,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 50.h,
        width: 90.w,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isBreakContainer ? PinkColor.p3 : GreyColor.g32),
            borderRadius: BorderRadius.circular(8.r)),
        child: Center(
          child: Text(
            widget.timeOfDay.format(context),
            style: _isTimeChanged()
                ? AppTextStyle.normal(fontSize: 18.sp, color: Colors.black)
                : AppTextStyle.normal(fontSize: 18.sp, color: GreyColor.g22),
          ),
        ),
      ),
    );
  }
}
