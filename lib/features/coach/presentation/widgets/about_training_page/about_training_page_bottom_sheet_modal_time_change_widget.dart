import 'package:flutter/material.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import 'about_training_page_bottom_sheet_modal_time_widget.dart';

class AboutTrainingPageBottomSheetModalTimeChangeWidget extends StatelessWidget {
  final void Function(TimeOfDay time) rescheduleTime;
  final CoachUpComingContentEntity coachUpComingContentEntity;

  const AboutTrainingPageBottomSheetModalTimeChangeWidget({
    super.key,
    required this.rescheduleTime,
    required this.coachUpComingContentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        12,
        (index) => AboutTrainingPageBottomSheetModalTimeWidget(
          rescheduleTime: rescheduleTime,
          date: DateTime.parse(
                  coachUpComingContentEntity.startOfAppointment)
              .add(
            Duration(minutes: 30 * (index + 1)),
          ),
        ),
      ),
    );
  }
}
