import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../../core/constants/coach/coach_page_constants.dart';

class TrainingOptionsSetPageTrainingTypeDropdownWidget extends StatelessWidget {
  final String? Function() trainingTypeValue;
  final void Function(String? value) updateTrainingType;

  const TrainingOptionsSetPageTrainingTypeDropdownWidget({
    super.key,
    required this.trainingTypeValue,
    required this.updateTrainingType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: GreyColor.g19)
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton(
              value: null,
              borderRadius: BorderRadius.circular(8.r),
              hint: Text(
                trainingTypeValue() ?? 'Выбрать',
                style: AppTextStyle.normal(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),

              icon: const SizedBox(),
              underline: const SizedBox(),
              items: CoachPageConstants.typesOfTraining
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      onTap: () {
                        updateTrainingType(e);
                      },
                      child: Text(
                        e,
                        style:
                            AppTextStyle.normal(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          SignupPageAssetIconWidget(path: IconPath.arrowDown)
        ],
      ),
    );
  }
}
