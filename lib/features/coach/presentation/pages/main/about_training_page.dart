import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/theme/colors/green_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/about_training_page/about_training_page_chatting_with_client_button.dart';
import '../../widgets/about_training_page/about_training_page_client_info_widget.dart';
import '../../widgets/about_training_page/about_training_page_info_display_widget.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';

class AboutTrainingPage extends StatefulWidget {
  final CoachUpComingContentEntity coachUpComingContentEntity;

  const AboutTrainingPage({
    super.key,
    required this.coachUpComingContentEntity,
  });

  @override
  State<AboutTrainingPage> createState() => _AboutTrainingPageState();
}

class _AboutTrainingPageState extends State<AboutTrainingPage> {
  late DateFormat _customDateFormat;

  @override
  void initState() {
    _customDateFormat = DateFormat('dd MMM yyyy года', 'ru');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('О тренировке'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              AboutTrainingPageClientInfoWidget(
                  coachUpComingContentEntity:
                      widget.coachUpComingContentEntity),
              AboutTrainingPageInfoDisplayWidget(
                  trainingType:
                      widget.coachUpComingContentEntity.type ?? 'null',
                  startOfAppointment:
                      widget.coachUpComingContentEntity.startOfAppointment,
                  endOfAppointment:
                      widget.coachUpComingContentEntity.endOfAppointment,
                  dateFormat: _customDateFormat),
              SizedBox(height: 30.h),
              const AboutTrainingPageChattingWithClientButton(),
              SizedBox(height: 106.h),
              Center(
                child: SizedBox(
                  width: 257.w,
                  height: 50.h,
                  child: AuthPageValidationButtonWidget(
                    name: 'Начать тренировку',
                    textStyle: AppTextStyle.semiBold(
                      fontSize: 17.sp,
                      color: Colors.white,
                    ),
                    buttonColor: GreenColor.g2,
                    buttonBorderColor: GreenColor.g2,
                  ),
                ),
              ),
              SizedBox(height: 50.h)
            ],
          ),
        ),
      ),
    );
  }
}
