
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class QualificationFieldsPageImageDragWidget extends StatelessWidget {
  const QualificationFieldsPageImageDragWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: Radius.circular(3.r),
      borderType: BorderType.RRect,
      color: PinkColor.p7,
      child: Container(
        height: 199.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: PinkColor.p7.withOpacity(0.51),
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 30.h),
                child: Image.asset(ImagePath.imageCloud, height: 58.h, width: 68.w,)),
            Text(
              'Поддерживаемые форматы:',
              style: AppTextStyle.normal(fontSize: 15.sp, color: Colors.black),
            ),
            Text(
              'JPEG, PNG, PDF, Word',
              style: AppTextStyle.medium(fontSize: 15.sp, color: Colors.black),
            ),

          ],
        ),
      ),
    );
  }
}
