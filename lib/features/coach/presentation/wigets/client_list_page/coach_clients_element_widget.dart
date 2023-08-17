
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_clients_list_text_style.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../data/models/coach_clients_content_model.dart';

class CoachClientsElementWidget extends StatelessWidget {
  final CoachClientsContentModel coachClientsContentModel;

  const CoachClientsElementWidget({
    super.key,
    required this.coachClientsContentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      margin: EdgeInsets.only(top: 20.h),
      constraints: BoxConstraints(minWidth: 365.w),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0.4.r,
          blurRadius: 10.r,
          offset: Offset(0, 1.w),
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 56.r,
              height: 56.r,
              decoration: BoxDecoration(
                  color: PinkColor.p6,
                  borderRadius: BorderRadius.circular(56.r)),
            ),
            SizedBox(width: 12.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coachClientsContentModel.email,
                  style: CoachClientsListTextStyle.clientsListTitle,
                ),
                Text(coachClientsContentModel.phoneNumber,
                    style: CoachClientsListTextStyle.clientsListSubTitle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
