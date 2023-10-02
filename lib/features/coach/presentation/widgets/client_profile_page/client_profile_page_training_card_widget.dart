
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';
import 'client_profile_page_coming_and_past_trainings_widget.dart';

class ClientProfilePageTrainingCardWidget extends StatelessWidget {
  final ClientProfilePageTrainingModel model;

  const ClientProfilePageTrainingCardWidget({
    super.key,
    required this.model,
  });

  String get _formattedDate {
    return DateFormat('EE, dd MMMM', 'ru').format(model.trainingDateTime);
  }

  String _formattedTimeOfDay(BuildContext context) {
    return TimeOfDay.fromDateTime(model.trainingDateTime).format(context);
  }

  Widget _buildDivider() {
    return Container(
      width: 1.w,
      color: PinkColor.p9,
      height: 21.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
    );
  }

  TextStyle get _trainingDescriptionStyle {
    return AppTextStyle.medium(fontSize: 16.spMin, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: PinkColor.p26,
              offset: Offset(0, 2.h),
              blurRadius: 2.r,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SignupPageAssetIconWidget(
                path: IconPath.done,
                color: PinkColor.p9,
                size: 28,
              ),
              SizedBox(width: 6.w),
              Text(
                model.type,
                style: AppTextStyle.medium(
                  fontSize: 15.sp,
                  color: PinkColor.p24,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _formattedDate,
                overflow: TextOverflow.ellipsis,
                style: _trainingDescriptionStyle,
              ),
              _buildDivider(),
              Text(
                _formattedTimeOfDay(context),
                overflow: TextOverflow.ellipsis,
                style: _trainingDescriptionStyle,
              ),
              _buildDivider(),
              Text(
                model.place,
                overflow: TextOverflow.ellipsis,
                style: _trainingDescriptionStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
