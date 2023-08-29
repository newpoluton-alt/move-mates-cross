import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/green_color.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../wigets/about_training_page/about_training_page_client_info_widget.dart';
import '../../wigets/qualification_page/qualification_page_app_bar_back_button.dart';

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
              const AboutTrainingPageClientInfoWidget(),
              AboutTrainingPageInfoDisplayWidget(
                  trainingType: widget.coachUpComingContentEntity.type,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutTrainingPageChattingWithClientButton extends StatelessWidget {
  const AboutTrainingPageChattingWithClientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: PinkColor.p9.withOpacity(0.5),
                  blurRadius: 4.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: MaterialButton(
              height: 47.h,
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignupPageAssetIconWidget(
                    path: IconPath.clientChatting,
                    color: PinkColor.p9,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'Связаться с клиентом',
                    style: AppTextStyle.medium(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'Для доп вопросов',
            style: AppTextStyle.normal(
              fontSize: 12.sp,
              color: GreyColor.g25,
            ),
          )
        ],
      ),
    );
  }
}

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

class AboutTrainingPageTrainingInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;

  const AboutTrainingPageTrainingInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SignupPageAssetIconWidget(
          path: iconPath,
          color: PinkColor.p9,
          size: 26,
        ),
        SizedBox(width: 6.w),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.normal(fontSize: 14.sp, color: PinkColor.p24),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: AppTextStyle.medium(
                fontSize: 17.sp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ],
    );
  }
}
