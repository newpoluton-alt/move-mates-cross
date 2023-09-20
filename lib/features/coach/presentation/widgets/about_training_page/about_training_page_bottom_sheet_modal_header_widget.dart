import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/green_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'about_training_page_dropdown_button_widget.dart';

class AboutTrainingPageBottomSheetModalHeaderWidget extends StatelessWidget {
  final bool Function() isDateAndTimeChanged;
  final ValueChanged<AboutTrainingPageDropdownElementModel> modelChanged;

  const AboutTrainingPageBottomSheetModalHeaderWidget({
    super.key,
    required this.modelChanged,
    required this.isDateAndTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Отменить',
                style: AppTextStyle.medium(
                  fontSize: 17.sp,
                  color: PinkColor.p15,
                ),
              ),
            ),
            Text(
              'Перенос',
              style: AppTextStyle.semiBold(
                fontSize: 17.sp,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                if (!isDateAndTimeChanged()) return;
                setState((){});
                modelChanged(const AboutTrainingPageDropdownElementModel(title: 'перенесена', textColor: GreenColor.g4));
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                'Добавить',
                style: AppTextStyle.medium(
                  fontSize: 17.sp,
                  color: PinkColor.p15,
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
