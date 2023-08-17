
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_calendar_text_style.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';

class CalendarEventWidget extends StatelessWidget {
  final CoachUpComingContentEntity coachUpComingContentEntity;
  final DateFormat coachCustomDateFormat;

  const CalendarEventWidget({
    super.key,
    required this.coachUpComingContentEntity,
    required this.coachCustomDateFormat,
  });

  DateTime _formattedDateTime(String unformattedDate) {
    return DateTime.tryParse(unformattedDate) ?? DateTime.now();
  }

  String _fromDateTimeToHoursAndMinutes(DateTime formattedDateTime) {
    return '${formattedDateTime.hour}:${formattedDateTime.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      height: 72.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4.w,
                height: 70.h,
                decoration: BoxDecoration(
                    color: PinkColor.p12,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Client ID ${coachUpComingContentEntity.clientId}',
                    style: CoachCalendarTextStyle.calendarEventWidgetTitle,
                  ),
                  Text(
                    '${coachUpComingContentEntity.description}\n'
                        '${coachUpComingContentEntity.type}',
                    style: CoachCalendarTextStyle.calendarEventWidgetSubtitle,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _fromDateTimeToHoursAndMinutes(_formattedDateTime(
                        coachUpComingContentEntity.startOfAppointment)),
                    style: CoachCalendarTextStyle.calendarEventWidgetTimeTitle,
                  ),
                  Text(
                    _fromDateTimeToHoursAndMinutes(_formattedDateTime(
                        coachUpComingContentEntity.endOfAppointment)),
                    style:
                    CoachCalendarTextStyle.calendarEventWidgetTimeSubtitle,
                  )
                ],
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            margin: EdgeInsets.only(left: 15.w),
            decoration:
            const BoxDecoration(color: GreyColor.g1),
          )
        ],
      ),
    );
  }
}
