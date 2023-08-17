
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_text_style.dart';

class SettingsPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SettingsPageAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 121.w,
      backgroundColor: GreyColor.g27.withOpacity(0),
      leading: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Отменить',
          style: CoachTextStyle.common(
              fontSize: 17.sp,
              color: PinkColor.p15,
              fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Готово',
              style: CoachTextStyle.common(
                  fontSize: 17.sp,
                  color: GreyColor.g24,
                  fontWeight: FontWeight.w500),
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
