
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/routes/assets_routes.dart';
import 'about_training_page_training_info_widget.dart';

class AboutTrainingPageInfoDisplayWidget extends StatelessWidget {
  final String trainingType;
  final DateFormat dateFormat;
  final String endOfAppointment;
  final String startOfAppointment;

  const AboutTrainingPageInfoDisplayWidget({
    super.key,
    required this.dateFormat,
    required this.trainingType,
    required this.endOfAppointment,
    required this.startOfAppointment,
  });

  String _parsedTime(String time, BuildContext context) {
    return TimeOfDay.fromDateTime(DateTime.parse(time)).format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 38.h),
          AboutTrainingPageTrainingInfoWidget(
              title: 'Специализация',
              subtitle: trainingType,
              iconPath: IconPath.dumbbellLarge),
          SizedBox(height: 20.h),
          const AboutTrainingPageTrainingInfoWidget(
              title: 'Локация',
              subtitle: 'Онлайн',
              iconPath: IconPath.location),
          SizedBox(height: 20.h),
          AboutTrainingPageTrainingInfoWidget(
              title: 'Appointment date',
              subtitle: dateFormat.format(DateTime.parse(startOfAppointment)),
              iconPath: IconPath.calendar),
          SizedBox(height: 20.h),
          AboutTrainingPageTrainingInfoWidget(
              title: 'Время',
              subtitle: '${_parsedTime(startOfAppointment, context)}'
                  '-${_parsedTime(endOfAppointment, context)}',
              iconPath: IconPath.clock),
          SizedBox(height: 20.h),
          const AboutTrainingPageTrainingInfoWidget(
              title: 'Общая цена',
              subtitle: '2000 сом',
              iconPath: IconPath.price),
        ],
      ),
    );
  }
}
