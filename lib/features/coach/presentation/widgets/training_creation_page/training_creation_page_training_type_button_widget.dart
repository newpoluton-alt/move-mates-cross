import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_options_set_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../pages/calendar/training_creation_page.dart';

class TrainingCreationPageTrainingTypeButtonWidget extends StatelessWidget {
  final TrainingType trainingType;

  bool get _isIndividualTraining => trainingType == TrainingType.individual;

  String get _determinePageTitleDueTrainingType =>
      _isIndividualTraining ? 'Индивидуальная' : 'Групповая';

  const TrainingCreationPageTrainingTypeButtonWidget({
    super.key,
    required this.trainingType,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  TrainingOptionsSetPage(trainingCountType: trainingType),
            ),
          );
        },
        child: Container(
            height: 54.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SignupPageAssetIconWidget(
                  path: IconPath.individualTraining,
                  color: PinkColor.p12,
                  size: 30,
                ),
                SizedBox(width: 9.w),
                Text(
                  _determinePageTitleDueTrainingType,
                  style: AppTextStyle.normal(
                    fontSize: 17.sp,
                    color: Colors.black,
                  ),
                ),
                const Expanded(child: SizedBox()),
                SignupPageAssetIconWidget(path: IconPath.forwardArrow, size: 24)
              ],
            )),
      ),
    );
  }
}
