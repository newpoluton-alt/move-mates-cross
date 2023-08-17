


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';

class ActionBarButtonWidget extends StatelessWidget {
  const ActionBarButtonWidget({
    super.key,
    required this.isFirstAction,
    required this.changeAction,
    required this.text,
  });

  final void Function() changeAction;
  final bool isFirstAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
          elevation: isFirstAction ? 5.w : 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isFirstAction ? Colors.white : Colors.transparent),
              borderRadius: BorderRadius.circular(8.r)),
          onPressed: isFirstAction ? () {} : changeAction,
          color: isFirstAction
              ? PinkColor.p6
              : GreyColor.g5,
          child: Text(
            text,
            style: isFirstAction
                ? CoachHomeTextStyle.actionBarSelected
                : CoachHomeTextStyle.actionBarUnselected,
          ),
        ));
  }
}
