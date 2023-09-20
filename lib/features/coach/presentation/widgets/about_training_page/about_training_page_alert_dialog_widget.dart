import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'about_training_page_cancel_confirm_dialog_content_widget.dart';
import 'about_training_page_dropdown_button_widget.dart';

void _submit({
  required BuildContext context,
  required GlobalKey<FormState> cancelConfirmDialogFormKey,
  required ValueChanged<AboutTrainingPageDropdownElementModel> modelChanged,
}) {
  bool validationValue = cancelConfirmDialogFormKey.currentState!.validate();
  if (!validationValue) return;
  FocusScope.of(context).unfocus();
  modelChanged(const AboutTrainingPageDropdownElementModel(
      title: 'отменена', textColor: PinkColor.p15));
  cancelConfirmDialogFormKey.currentState!.save();
  Navigator.of(context).pop();
  Navigator.of(context).pop();
}

void _showAboutTrainingPageCancelConfirmDialog(
  BuildContext context,
  ValueChanged<AboutTrainingPageDropdownElementModel> modelChanged,
) async {
  GlobalKey<FormState> cancelConfirmDialogFormKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        title: Text(
          'Перед отменой',
          style: AppTextStyle.semiBold(
            fontSize: 17.sp,
            color: Colors.black,
          ),
        ),
        content: AboutTrainingPageCancelConfirmDialogContentWidget(
          cancelConfirmDialogFormKey: cancelConfirmDialogFormKey,
        ),
        actions: [
          TextButton(
            onPressed: () {
              _submit(
                  context: context,
                  modelChanged: modelChanged,
                  cancelConfirmDialogFormKey: cancelConfirmDialogFormKey);
            },
            child: const Text('Отправить'),
          ),
        ],
      );
    },
  );
}

void showAboutTrainingPageCancelDialog({
  required BuildContext context,
  required CoachUpComingContentEntity coachUpComingContentEntity,
  required ValueChanged<AboutTrainingPageDropdownElementModel> defineModel,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          title: Text(
            'Вы уверены, что хотите отменить?',
            style: AppTextStyle.semiBold(fontSize: 17.sp, color: Colors.black),
          ),
          content: Text(
            'Отменять сессию больше двух раз '
            'в месяц нельзя. Оплата производиться не будет.',
            style: AppTextStyle.medium(
              fontSize: 13.sp,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showAboutTrainingPageCancelConfirmDialog(context, defineModel);
              },
              child: const Text('Да'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Нет'),
            )
          ],
        );
      });
}
