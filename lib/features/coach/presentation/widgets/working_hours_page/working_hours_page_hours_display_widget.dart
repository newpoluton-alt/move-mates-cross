import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'working_hours_page_brake_hours_display_widget.dart';
import 'working_hours_page_hour_container_widget.dart';

class WorkingHoursPageHoursDisplayWidget extends StatefulWidget {
  final String dayOfWeek;

  const WorkingHoursPageHoursDisplayWidget({
    super.key,
    required this.dayOfWeek,
  });

  @override
  State<WorkingHoursPageHoursDisplayWidget> createState() =>
      _WorkingHoursPageHoursDisplayWidgetState();
}

class _WorkingHoursPageHoursDisplayWidgetState
    extends State<WorkingHoursPageHoursDisplayWidget> {
  late bool _checkBoxValue;
  late TimeOfDay _leftTimeOfDay;
  late TimeOfDay _rightTimeOfDay;
  late List<WorkingHoursPageBrakeDisplayWidget>
      _workingHoursPageBreakDisplayWidgetsList;

  @override
  void initState() {
    _checkBoxValue = false;
    _workingHoursPageBreakDisplayWidgetsList = [];
    _leftTimeOfDay = const TimeOfDay(hour: 0, minute: 0);
    _rightTimeOfDay = const TimeOfDay(hour: 0, minute: 0);
    super.initState();
  }

  void _changeCheckBoxValue(bool newValue) {
    setState(() {
      _checkBoxValue = newValue;
    });
  }

  void _addBreakWidget() {
    setState(() {
      _workingHoursPageBreakDisplayWidgetsList
          .add(WorkingHoursPageBrakeDisplayWidget(
        id: UniqueKey().toString(),
        removeWidget: _removeBreakWidget,
      ));
    });
  }

  void _removeBreakWidget(String id) {
    setState(() {
      _workingHoursPageBreakDisplayWidgetsList
          .removeWhere((element) => element.id == id);
    });
  }

  void _refreshLeftTimeOfDay({
    required TimeOfDay selectedTimeOfDay,
  }) {
    setState(() {
      _leftTimeOfDay = selectedTimeOfDay;
    });
  }

  bool _isTimeNotAddable(TimeOfDay selectedTime) {
    return _leftTimeOfDay.hour >= selectedTime.hour;
  }

  bool _isDayChecked() => _checkBoxValue;

  void _refreshRightTimeOfDay({
    required TimeOfDay selectedTimeOfDay,
  }) {
    if (_isTimeNotAddable(selectedTimeOfDay)) return;
    setState(() {
      _rightTimeOfDay = selectedTimeOfDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: _checkBoxValue,
              onChanged: (value) {
                _changeCheckBoxValue(value ?? false);
              },
              activeColor: PinkColor.p19,
            ),
            Text(
              widget.dayOfWeek,
              style: AppTextStyle.semiBold(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 6.w),
            WorkingHoursPageHourContainerWidget(
              isBreakContainer: false,
              timeOfDay: _leftTimeOfDay,
              refreshTimeOfDay: _refreshLeftTimeOfDay,
              isDayChecked: _isDayChecked,
            ),
            Container(
              width: 10.w,
              height: 1.h,
              decoration: const BoxDecoration(color: Colors.black),
              margin: EdgeInsets.symmetric(horizontal: 6.w),
            ),
            WorkingHoursPageHourContainerWidget(
              isBreakContainer: false,
              timeOfDay: _rightTimeOfDay,
              isDayChecked: _isDayChecked,
              refreshTimeOfDay: _refreshRightTimeOfDay,
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {
                if(!_checkBoxValue) return;
                _addBreakWidget();
              },
              icon: SignupPageAssetIconWidget(path: IconPath.addButton),
            )
          ],
        ),
        ..._workingHoursPageBreakDisplayWidgetsList,
      ],
    );
  }
}
