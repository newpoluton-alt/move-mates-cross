import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';

class AboutTrainingPageCancelConfirmDialogContentWidget
    extends StatelessWidget {
  const AboutTrainingPageCancelConfirmDialogContentWidget({
    super.key,
    required this.cancelConfirmDialogFormKey,
  });

  final GlobalKey<FormState> cancelConfirmDialogFormKey;

  InputBorder get _enabledInputBorder => OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(10.r));

  InputBorder get _errorInputBorder => OutlineInputBorder(
    borderSide: const BorderSide(color: PinkColor.p15),
    borderRadius: BorderRadius.circular(10.r),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: cancelConfirmDialogFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Напишите небольшое объяснение.',
              style: AppTextStyle.normal(
                fontSize: 13.sp,
                color: Colors.black,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: GreyColor.g8,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                errorBorder: _errorInputBorder,
                enabledBorder: _enabledInputBorder,
                focusedBorder: _enabledInputBorder,
                focusedErrorBorder: _errorInputBorder,
                errorStyle: const TextStyle(fontSize: 0),
              ),
              validator: (value) {
                if ((value?? '').trim().isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
