import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

class TrainingOptionsSetPageMoveToNextPageWidget extends StatelessWidget {
  final Widget nextPage;
  final String? Function() acquireTitleValue;
  final void Function(String value) updateTitleValue;

  const TrainingOptionsSetPageMoveToNextPageWidget({
    super.key,
    required this.nextPage,
    required this.updateTitleValue,
    required this.acquireTitleValue,
  });

  String _checkIfTitleNeitherNullNorEmpty() {
    if ((acquireTitleValue() ?? '').isEmpty) {
      return 'Выбрать';
    } else {
      return acquireTitleValue()!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        child: Container(
          height: 56.h,
          width: 1.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: GreyColor.g19),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 1.sw - 100.w,
                child: Text(
                  _checkIfTitleNeitherNullNorEmpty(),
                  style: AppTextStyle.normal(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SignupPageAssetIconWidget(
                path: IconPath.forwardArrow,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
