import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/coach/data/models/coach_clients_content_model.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/client_profile_page/client_profile_page_about_client_widget.dart';
import '../../widgets/client_profile_page/client_profile_page_client_info_widget.dart';
import '../../widgets/client_profile_page/client_profile_page_coming_and_past_trainings_widget.dart';
import '../../widgets/client_profile_page/client_profile_page_trainings_filterer_widget.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';

class ClientProfilePage extends StatefulWidget {
  final CoachClientsContentModel clientsContentModel;

  const ClientProfilePage({
    super.key,
    required this.clientsContentModel,
  });

  @override
  State<ClientProfilePage> createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  late bool _isUpcomingNotPushed;

  @override
  void initState() {
    _isUpcomingNotPushed = false;
    super.initState();
  }

  void defineAlternationValue(bool value) {
    setState(() {
      _isUpcomingNotPushed = value;
    });
  }

  bool alternationValue() => _isUpcomingNotPushed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('Профиль клиента'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 80.r,
                  width: 80.r,
                  decoration: BoxDecoration(
                    color: PinkColor.p1,
                    borderRadius: BorderRadius.circular(80.r),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  widget.clientsContentModel.userName ?? 'Имя клиента',
                  style: AppTextStyle.semiBold(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Клиент',
                  style: AppTextStyle.medium(
                    fontSize: 15.sp,
                    color: PinkColor.p24,
                  ),
                ),
                SizedBox(height: 20.sp),
                Wrap(
                  children: CoachPageConstants.clientInfoPageClientInfo
                      .map((e) => ClientProfilePageClientInfoWidget(
                          additionalInfoModel: e))
                      .toList(),
                ),
                SizedBox(height: 23.h),
                const ClientProfilePageAboutClientWidget(),
                SizedBox(height: 25.h),
                ClientProfilePageComingAndPastTrainings(
                  alternationValue: alternationValue,
                  defineAlternationValue: defineAlternationValue,
                ),
                SizedBox(height: 10.h),
                ClientProfilePageTrainingsFiltererWidget(
                    alternationValue: alternationValue),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientAdditionalInfoModel {
  final String title;
  final String description;

  const ClientAdditionalInfoModel({
    required this.title,
    required this.description,
  });
}
