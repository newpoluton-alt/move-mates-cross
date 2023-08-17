import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';

class CoachSearchTextFieldWidget extends StatelessWidget {
  const CoachSearchTextFieldWidget({
    super.key,
    required InputBorder outlineTextFieldBorder,
    required this.coachTextEditingController,
    required this.checkIfTextHasChanges,
  }) : _outlineTextFieldBorder = outlineTextFieldBorder;
  final void Function() checkIfTextHasChanges;
  final InputBorder _outlineTextFieldBorder;
  final TextEditingController coachTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: GreyColor.g12,
          borderRadius: BorderRadius.circular(10.r)),
      child: TextField(
        controller: coachTextEditingController,
        onChanged: (text){
          checkIfTextHasChanges();
        },
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            enabled: true,
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
            focusedBorder: _outlineTextFieldBorder,
            hintText: 'Search',
            hintStyle: const TextStyle(color: GreyColor.g13),
            prefixIcon: Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              child: AssetIcon(
                path: IconPath.search,
                color: GreyColor.g13,
              ),
            ),
            prefixIconConstraints:
                BoxConstraints(minWidth: 15.w, minHeight: 15.w),
            border: _outlineTextFieldBorder),
      ),
    );
  }
}
