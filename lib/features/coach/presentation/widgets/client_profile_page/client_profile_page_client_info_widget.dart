import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/client_list/client_profile_page.dart';

class ClientProfilePageClientInfoWidget extends StatelessWidget {
  final ClientAdditionalInfoModel additionalInfoModel;

  const ClientProfilePageClientInfoWidget({
    super.key,
    required this.additionalInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 152.w,
      margin: EdgeInsets.only(bottom: 5.h, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      child: Column(
        children: [
          Text(
            additionalInfoModel.title,
            style: AppTextStyle.medium(
              fontSize: 14.sp,
              color: PinkColor.p24,
            ),
          ),
          Text(
            additionalInfoModel.description,
            style: AppTextStyle.medium(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
