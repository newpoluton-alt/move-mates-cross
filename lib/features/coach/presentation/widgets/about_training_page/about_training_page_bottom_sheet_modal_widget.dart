import 'package:flutter/material.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import 'about_training_page_bottom_sheet_modal_content_widget.dart';
import 'about_training_page_dropdown_button_widget.dart';

void showAboutTrainingPageBottomSheetModal({
  required BuildContext context,
  required CoachUpComingContentEntity coachUpComingContentEntity,
  required ValueChanged<AboutTrainingPageDropdownElementModel> defineModel,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return AboutTrainingPageBottomSheetModalContentWidget(
        defineModel: defineModel,
        coachUpComingContentEntity: coachUpComingContentEntity,
      );
    },
  );
}
