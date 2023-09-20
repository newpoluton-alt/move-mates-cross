import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import 'about_training_page_bottom_sheet_modal_content_info_widget.dart';
import 'about_training_page_bottom_sheet_modal_header_widget.dart';
import 'about_training_page_dropdown_button_widget.dart';
import 'about_training_page_postpone_appoinment_wiget.dart';

class AboutTrainingPageBottomSheetModalContentWidget extends StatefulWidget {
  final CoachUpComingContentEntity coachUpComingContentEntity;
  final ValueChanged<AboutTrainingPageDropdownElementModel> defineModel;

  const AboutTrainingPageBottomSheetModalContentWidget({
    super.key,
    required this.defineModel,
    required this.coachUpComingContentEntity,
  });

  @override
  State<AboutTrainingPageBottomSheetModalContentWidget> createState() =>
      _AboutTrainingPageBottomSheetModalContentWidgetState();
}

class _AboutTrainingPageBottomSheetModalContentWidgetState
    extends State<AboutTrainingPageBottomSheetModalContentWidget> {
  DateTime? _appointmentDate;
  TimeOfDay? _appointmentTime;

  @override
  void initState() {
    super.initState();
  }

  void _refreshSelectedDate(DateTime date) {
    setState(() {
      _appointmentDate = date;
    });
  }

  void _refreshSelectedTime(TimeOfDay time) {
    setState(() {
      _appointmentTime = time;
    });
  }

  bool _isDateAndTimeChanged() {
    bool isDateNoNull = _appointmentDate != null;
    bool isTimeNoNull = _appointmentTime != null;
    return isDateNoNull && isTimeNoNull;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.90.sh,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(249, 249, 249, 0.94),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutTrainingPageBottomSheetModalHeaderWidget(
                modelChanged: widget.defineModel,
                isDateAndTimeChanged: _isDateAndTimeChanged,
              ),
              SizedBox(height: 35.h),
              const AboutTrainingPageBottomSheetModalContentInfoWidget(
                label: 'Тип тренировки',
                title: 'Индивидуальная',
              ),
              SizedBox(height: 20.h),
              const AboutTrainingPageBottomSheetModalContentInfoWidget(
                label: 'Специализация',
                title: 'стретчиннг (МФР)',
              ),
              SizedBox(height: 8.h),
              Container(
                height: 42.h,
                width: 206.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: GreyColor.g19),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Онлайн',
                  style: AppTextStyle.normal(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AboutTrainingPagePostponeAppointmentWidget(
                refreshSelectedDate: _refreshSelectedDate,
                refreshSelectedTime: _refreshSelectedTime,
                coachUpComingContentEntity: widget.coachUpComingContentEntity,
              ),
              SizedBox(height: 20.h),
              const AboutTrainingPageBottomSheetModalContentInfoWidget(
                label: 'Клиент',
                title: 'Айнура А.',
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
