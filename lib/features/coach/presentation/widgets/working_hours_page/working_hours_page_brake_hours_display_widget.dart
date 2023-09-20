

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'working_hours_page_hour_container_widget.dart';

class WorkingHoursPageBrakeDisplayWidget extends StatefulWidget {
  final String id;
  final void Function(String id) removeWidget;

  const WorkingHoursPageBrakeDisplayWidget({
    super.key,
    required this.id,
    required this.removeWidget,
  });

  @override
  State<WorkingHoursPageBrakeDisplayWidget> createState() =>
      _WorkingHoursPageBrakeDisplayWidgetState();
}

class _WorkingHoursPageBrakeDisplayWidgetState
    extends State<WorkingHoursPageBrakeDisplayWidget> {
  late TimeOfDay _leftTimeOfDay;
  late TimeOfDay _rightTimeOfDay;

  void _refreshLeftTimeOfDay({
    required TimeOfDay selectedTimeOfDay,
  }) {
    setState(() {
      _leftTimeOfDay = selectedTimeOfDay;
    });
  }

  void _refreshRightTimeOfDay({
    required TimeOfDay selectedTimeOfDay,
  }) {
    setState(() {
      _rightTimeOfDay = selectedTimeOfDay;
    });
  }

  @override
  void initState() {
    _leftTimeOfDay = const TimeOfDay(hour: 0, minute: 0);
    _rightTimeOfDay = const TimeOfDay(hour: 0, minute: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Перерыв',
              style: AppTextStyle.normal(
                fontSize: 14.sp,
                color: Colors.black,
              )),
          SizedBox(width: 6.w),
          WorkingHoursPageHourContainerWidget(
              isBreakContainer: true,
              timeOfDay: _leftTimeOfDay,
              refreshTimeOfDay: _refreshLeftTimeOfDay),
          Container(
            width: 10.w,
            height: 1.h,
            decoration: const BoxDecoration(color: Colors.black),
            margin: EdgeInsets.symmetric(horizontal: 8.w),
          ),
          WorkingHoursPageHourContainerWidget(
              isBreakContainer: true,
              timeOfDay: _rightTimeOfDay,
              refreshTimeOfDay: _refreshRightTimeOfDay),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              widget.removeWidget(widget.id);
            },
            icon: SignupPageAssetIconWidget(path: IconPath.trash),
          )
        ],
      ),
    );
  }
}
