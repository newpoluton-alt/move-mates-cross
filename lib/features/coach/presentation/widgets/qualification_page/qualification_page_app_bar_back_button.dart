
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class QualificationPageAppBarBackButton extends StatelessWidget {
  const QualificationPageAppBarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SignupPageAssetIconWidget(path: IconPath.backButton, color: PinkColor.p3),
          Text(
            'Назад',
            style: AppTextStyle.medium(fontSize: 17.sp, color: PinkColor.p3),
          )
        ],
      ),
    );
  }
}
