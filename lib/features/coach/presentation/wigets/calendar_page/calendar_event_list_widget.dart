
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../../domain/entities/coach_up_coming_content_entity.dart';
import '../../cubit/coach_state.dart';
import '../chief_page/training_action_widget.dart';
import 'calendar_event_widget.dart';

class CoachCalendarEventListWidget extends StatelessWidget {
  const CoachCalendarEventListWidget({
    super.key,
    required this.trainingActionNotifier,
    required this.coachCustomDateFormat,
    required this.state,
  });

  final TrainingActionNotifier trainingActionNotifier;
  final DateFormat coachCustomDateFormat;
  final CoachState state;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<CoachUpComingContentEntity>?>(
        valueListenable: trainingActionNotifier.trainings,
        builder: (context, value, _) {
          if (value == null || value.isEmpty) {
            return Container(
                margin: EdgeInsets.only(top: 80.h),
                child: (state is CoachStateLoading)
                    ? const CircularProgressIndicator()
                    : Text('Нет событий',
                    style: CoachHomeTextStyle.noTraining));
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 230.h,
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) => CalendarEventWidget(
                      coachCustomDateFormat: coachCustomDateFormat,
                      coachUpComingContentEntity: value.elementAt(index)),
                ),
              ),
            );
          }
        });
  }
}
