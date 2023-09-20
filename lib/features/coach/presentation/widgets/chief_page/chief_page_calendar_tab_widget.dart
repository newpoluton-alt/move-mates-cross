import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/core/constants/error_messages.dart';
import 'package:move_mates_android/features/coach/data/models/coach_up_coming_model.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_state.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_home_text_style.dart';
import '../../cubit/coach_cubit.dart';

class ChiefPageCalendarTabWidget extends StatelessWidget{
  const ChiefPageCalendarTabWidget({
    super.key,
    required this.temp,
    required this.dayFormat,
    required this.dMYFormat,
    required this.currentDate,
    required this.weekDayFormat,
    required this.changeCurrentDate,
    required this.coachCustomDateFormat,
  });

  final String currentDate;
  final List<DateTime> temp;
  final DateFormat dayFormat;
  final DateFormat dMYFormat;
  final DateFormat weekDayFormat;
  final DateFormat coachCustomDateFormat;
  final void Function(String newCurrentDate) changeCurrentDate;

  bool isTheDatesSame(DateTime date) =>
      dMYFormat.format(date) == dMYFormat.format(DateTime.now());

  bool isTheDateSelected(DateTime date, String currentDate) =>
      coachCustomDateFormat.format(date) == currentDate;

  bool doesDateHaveEvents(Object model, DateTime date) {
    return (model as CoachUpComingModel).content.any((element) {
      return (coachCustomDateFormat.format(coachCustomDateFormat
          .parse(element.startOfAppointment)) ==
          coachCustomDateFormat.format(date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {
      if (state is CoachStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is CoachStateLoaded) {
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: temp.map((date) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    changeCurrentDate(coachCustomDateFormat.format(date));
                  },
                  borderRadius: BorderRadius.circular(18.r),
                  child: Container(
                    width: 40.w,
                    height: 72.w,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                        color: isTheDatesSame(date)
                            ? PinkColor.p5
                            : (isTheDateSelected(date, currentDate))
                                ? GreyColor.g11
                                : Colors.white,
                        border: Border.all(color: PinkColor.p5),
                        borderRadius: BorderRadius.circular(18.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          weekDayFormat.format(date),
                          style: isTheDatesSame(date)
                              ? CoachHomeTextStyle.calendarBarCurrent
                              : CoachHomeTextStyle.calendarBarAnother,
                        ),
                        Text(
                          dayFormat.format(date),
                          style: isTheDatesSame(date)
                              ? CoachHomeTextStyle.calendarBarCurrent
                              : CoachHomeTextStyle.calendarBarAnother,
                        ),
                        if (doesDateHaveEvents(state.model, date))
                          Container(
                            height: 6.r,
                            width: 6.r,
                            decoration: BoxDecoration(
                                color: PinkColor.p1,
                                borderRadius: BorderRadius.circular(6.r)),
                          )
                        else
                          const SizedBox()
                      ],
                    ),
                  ),
                );
              }).toList(),
            ));
      }
      return Center(
        child: Text(
          ErrorMessages.problemsWithServerMessage,
          style: CoachHomeTextStyle.noTraining,
        ),
      );
    });
  }
}
