import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/working_hours_calendar_page.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/profile_page/profile_page_button_widget.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/qualification_page/qualification_page_app_bar_back_button.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';
import '../../wigets/working_hours_page/working_hours_page_hours_display_widget.dart';

class WorkingHoursPage extends StatefulWidget {
  const WorkingHoursPage({super.key});

  static const String id = 'working_hours_page';

  @override
  State<WorkingHoursPage> createState() => _WorkingHoursPageState();
}

class _WorkingHoursPageState extends State<WorkingHoursPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 115.w,
        title: const Text('Рабочие часы'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      backgroundColor: GreyColor.g8,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 17.h),
              Text(
                'Выберите дату и время, в которые вы работаете',
                style:
                    AppTextStyle.normal(fontSize: 14.sp, color: GreyColor.g31),
              ),
              SizedBox(height: 17.h),
              ...CoachPageConstants.daysOfWeek.map((day) => Container(
                  margin: EdgeInsets.only(bottom: 25.h),
                  child: WorkingHoursPageHoursDisplayWidget(dayOfWeek: day))),
              Text(
                'Выходные дни',
                style:
                    AppTextStyle.medium(fontSize: 15.sp, color: GreyColor.g9),
              ),
              SizedBox(height: 8.h),
              const ProfilePageButtonWidget(
                  title: 'Выбрать', pageId: WorkingHoursCalendarPage.id),
              SizedBox(height: 66.h),
              AuthPageValidationButtonWidget(
                  name: 'Потвердить',
                  buttonColor: Colors.black,
                  textStyle: AppTextStyle.semiBold(
                    fontSize: 17.sp,
                    color: Colors.white,
                  )),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
