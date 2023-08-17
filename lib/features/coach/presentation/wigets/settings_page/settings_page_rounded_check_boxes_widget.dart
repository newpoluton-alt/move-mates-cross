import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_text_style.dart';

class SettingsPageRoundedCheckBoxesWidget extends StatelessWidget {
  bool firstCheckBoxBool;
  bool secondCheckBoxBool;
  final void Function(int id) refreshData;

  SettingsPageRoundedCheckBoxesWidget({
    super.key,
    required this.refreshData,
    required this.firstCheckBoxBool,
    required this.secondCheckBoxBool,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _customCheckBox(
            checkBoxId: 0,
            title: 'Онлайн',
            isTrue: firstCheckBoxBool,
          ),
          SizedBox(width: 15.w),
          _customCheckBox(
            checkBoxId: 1,
            title: 'Оффлайн',
            isTrue: secondCheckBoxBool,
          )
        ],
      ),
    );
  }

  Widget _customCheckBox({
    required bool isTrue,
    required String title,
    required int checkBoxId,
  }) {
    return StatefulBuilder(builder: (context, setState) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isTrue,
            activeColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
                side: const BorderSide(color: GreyColor.g19)),
            onChanged: (value) {
              refreshData(checkBoxId);
              setState(() {
                isTrue = value ?? false;
              });
            },
          ),
          Text(
            title,
            style: CoachTextStyle.common(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          )
        ],
      );
    });
  }
}
