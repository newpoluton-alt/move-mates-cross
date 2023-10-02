import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class ProfilePageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function() settingsPageSubmit;

  const ProfilePageAppBarWidget({
    super.key,
    required this.settingsPageSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 121.w,
      backgroundColor: GreyColor.g8.withOpacity(0),
      leading: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Отменить',
          style: AppTextStyle.medium(
              fontSize: 17.sp,
              color: PinkColor.p15,),
        ),
      ),
      actions: [
        TextButton(
            onPressed: settingsPageSubmit,
            child: Text(
              'Готово',
              style: AppTextStyle.medium(
                  fontSize: 17.sp,
                  color: PinkColor.p15,),
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
