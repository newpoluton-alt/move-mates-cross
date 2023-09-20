
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'about_training_page_client_info_widget.dart';

// ignore: must_be_immutable
class AboutTrainingPageClientInfoDropdownItemWidget extends StatelessWidget {
  void Function()? onTap;
  final AboutTrainingPageDropdownButtonItemModel model;

  AboutTrainingPageClientInfoDropdownItemWidget({
    super.key,
    this.onTap,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 39.h,
        width: double.infinity,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            model.text,
            style: AppTextStyle.medium(
              fontSize: 13.sp,
              color: model.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
