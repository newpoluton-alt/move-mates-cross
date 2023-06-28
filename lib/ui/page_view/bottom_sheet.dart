import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth/auth_page.dart';
import '../theme/text_style.dart';

class PageViewBottomSheet extends StatelessWidget {
  const PageViewBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(LoginAndSignUpPage.id);
            },
            child: Row(
              mainAxisSize:MainAxisSize.min,
              children: [
                Text('Начать', style: AppTextStyle.regularFunctionalWhite),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 30.r,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}