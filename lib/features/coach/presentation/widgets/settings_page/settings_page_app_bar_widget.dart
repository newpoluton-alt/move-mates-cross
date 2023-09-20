
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../pages/main/profile_page.dart';

class SettingsPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SettingsPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leadingWidth: 130.w,
      title: const Text('Выходные дни'),
      backgroundColor: GreyColor.g8.withOpacity(0),
      leading: MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SignupPageAssetIconWidget(
              path: IconPath.backButton,
              color: PinkColor.p3,
            ),
            Text(
              'Главная',
              style: AppTextStyle.medium(
                fontSize: 17.sp,
                color: PinkColor.p3,
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ProfilePage.id);
          },
          child: Text(
            'Edit',
            style: AppTextStyle.medium(
              fontSize: 17.sp,
              color: PinkColor.p15,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
