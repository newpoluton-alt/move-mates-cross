
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../../core/constants/coach/coach_page_constants.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';
import '../../pages/chief/settings_page.dart';

class SettingsPageElementsViewWidget extends StatelessWidget {
  const SettingsPageElementsViewWidget({super.key});
  BorderRadius _customSettingsBorderRadius(SettingsPageElementModel model) {
    bool isFirstElement =
    (model == CoachPageConstants.settingsPageElementModelList.first);
    bool isLastElement =
    (model == CoachPageConstants.settingsPageElementModelList.last);
    return BorderRadius.vertical(
        top: isFirstElement ? Radius.circular(10.r) : const Radius.circular(0),
        bottom:
        isLastElement ? Radius.circular(10.r) : const Radius.circular(0));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: CoachPageConstants.settingsPageElementModelList
            .map((element) => Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: _customSettingsBorderRadius(element),
            onTap: () {
              Navigator.of(context).pushNamed(element.route);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: _customSettingsBorderRadius(element),
              ),
              padding: EdgeInsets.only(top: 16.h, left: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SignupPageAssetIconWidget(
                          color: PinkColor.p21, path: element.iconPath),
                      SizedBox(width: 8.w),
                      Text(
                        element.name,
                        style: AppTextStyle.medium(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      SignupPageAssetIconWidget(
                        path: IconPath.forwardArrow,
                        size: 12,
                      ),
                      SizedBox(width: 16.w)
                    ],
                  ),
                  (element ==
                      CoachPageConstants
                          .settingsPageElementModelList.last)
                      ? SizedBox(height: 16.h)
                      : Container(
                    width: 305.w,
                    height: 1.h,
                    margin: EdgeInsets.only(top: 16.h),
                    decoration:
                    const BoxDecoration(color: GreyColor.g19),
                  )
                ],
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
