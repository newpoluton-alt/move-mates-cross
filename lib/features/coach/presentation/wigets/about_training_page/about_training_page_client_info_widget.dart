
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class AboutTrainingPageClientInfoWidget extends StatelessWidget {
  const AboutTrainingPageClientInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 306.w,
        height: 80.h,
        padding: EdgeInsets.only(left: 23.w),
        decoration: BoxDecoration(
          color: PinkColor.p22,
          border: Border.all(color: PinkColor.p1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 9.h,
            right: 12.w,
            bottom: 9.h,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 23.h,
                  width: 77.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: PinkColor.p23,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(5.r),
                      icon: const SizedBox(),
                      underline: const SizedBox(),
                      hint: Text(
                        'Изменить',
                        style: AppTextStyle.medium(
                            fontSize: 12.sp, color: Colors.white),
                      ),
                      isDense: true,
                      items: [],
                      onChanged: (value) {}),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 53.r,
                      width: 53.r,
                      decoration: BoxDecoration(
                          color: PinkColor.p6,
                          borderRadius: BorderRadius.circular(53.r)),
                    ),
                    SizedBox(width: 15.w),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Имя клиента',
                            style: AppTextStyle.semiBold(
                                fontSize: 16.sp, color: Colors.black),
                          ),
                          Text(
                            'Ж - 29 лет - 175 см - 65 кг',
                            style: AppTextStyle.medium(
                                fontSize: 12.sp, color: PinkColor.p1),
                          )
                        ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
