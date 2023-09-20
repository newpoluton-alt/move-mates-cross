import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';

class ClientProfilePageAboutClientWidget extends StatelessWidget {
  const ClientProfilePageAboutClientWidget({super.key});

  String get _description =>
      'У меня проблема с коленом, которая влияет на мою подвижность и '
      'требует от меня внимания к определенным движениям и действиям.'
      ' Хотя это может создавать ограничения,'
      ' я полнa решимости найти способы укрепить и поддержать мои колени,'
      ' чтобы обеспечить безопасный и приятный спортивный опыт.';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Обо мне',
          style: AppTextStyle.semiBold(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(17.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            _description,
            style: AppTextStyle.medium(
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
        ),

      ],
    );
  }
}
