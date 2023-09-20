import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_calendar_text_style.dart';
import 'package:move_mates_android/features/coach/coach_injection_container.dart'
    as di;
import 'package:move_mates_android/features/coach/data/models/coach_up_coming_model.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_creation_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_custom_snackbar_builder.dart';
import '../../cubit/coach_state.dart';
import '../../widgets/calendar_page/calendar_page_calendar_event_list_widget.dart';
import '../../widgets/calendar_page/calendar_page_coach_calendar_widget.dart';
import '../../widgets/calendar_page/calendar_page_create_training_button.dart';
import '../../widgets/chief_page/chief_page_training_action_widget.dart';
import '../coach_main_page.dart';
import '../main/specialisation_page.dart';

class CalendarPage extends StatefulWidget implements CoachPage {
  @override
  String pageNameValue() {
    return pageName;
  }

  static const String pageName = 'Календарь';

  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime currentDate;
  late DateTime focusedDate;
  late final TrainingActionNotifier trainingActionNotifier;
  late DateFormat coachCustomDateFormat;
  late DateFormat coachCustomParseDateFormat;
  late List<CoachUpComingContentEntity> coachUpComingContentList;

  @override
  void initState() {
    trainingActionNotifier = TrainingActionNotifier();
    currentDate = DateTime.now();
    focusedDate = currentDate;
    coachUpComingContentList = [];
    coachCustomParseDateFormat = DateFormat('yyyy-MM-dd', 'ru');
    coachCustomDateFormat = DateFormat('yyyy-MM-dd HH-mm-ss', 'ru');
    super.initState();
  }

  @override
  void dispose() {
    trainingActionNotifier.dispose();
    di.sl<CoachCubit>().close();
    super.dispose();
  }

  void _onChangeCurrentDay(DateTime anotherDay, DateTime focusedDay) {
    setState(() {
      focusedDate = anotherDay;
    });
  }

  bool _isDatesSame(DateTime date, DateTime parsedDate) {
    return (date.day == parsedDate.day &&
        date.month == parsedDate.month &&
        date.year == parsedDate.year);
  }

  BoxDecoration _determineSelectedDateDecoration() {
    return _isDatesSame(currentDate, focusedDate)
        ? BoxDecoration(
            shape: BoxShape.rectangle,
            color: PinkColor.p13,
            borderRadius: BorderRadius.circular(100.r))
        : BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            borderRadius: BorderRadius.circular(100.r),
          );
  }

  List<CoachUpComingContentEntity> _filterContentByCurrentDate(
      {required List<CoachUpComingContentEntity> contentEntityList}) {
    List<CoachUpComingContentEntity> tempContentEntityList = [];
    for (CoachUpComingContentEntity elem in contentEntityList) {
      if (_isDatesSame(focusedDate, DateTime.parse(elem.startOfAppointment))) {
        tempContentEntityList.add(elem);
      }
    }
    return tempContentEntityList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoachCubit>(
      create: (_) => di.sl<CoachCubit>()
        ..onGetUpComings(UpComingParam(
            fromDate: coachCustomParseDateFormat.format(DateTime.now()),
            size: 50,
            page: 0)),
      child: BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {
        if (state is CoachStateLoaded) {
          CoachUpComingModel tempModel = (state.model as CoachUpComingModel);
          coachUpComingContentList = tempModel.content;
          trainingActionNotifier.addTrainings(_filterContentByCurrentDate(
              contentEntityList: tempModel.content));
        }
        if (state is CoachStateError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context)
                .showSnackBar(buildAuthPageCustomSnackBar(state.error));
          });
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalendarPageCoachCalendarWidget(
              focusedDate: focusedDate,
              currentDate: currentDate,
              isDatesSame: _isDatesSame,
              onChangeCurrentDay: _onChangeCurrentDay,
              determineSelectedDateDecoration: _determineSelectedDateDecoration,
              upComingEvents: coachUpComingContentList,
            ),
            SizedBox(height: 11.h),
            const CalendarPageCreateTrainingButton(),
            SizedBox(height: 15.h),
            CalendarPageCoachCalendarEventListWidget(
                state: state,
                trainingActionNotifier: trainingActionNotifier,
                coachCustomDateFormat: coachCustomDateFormat),
          ],
        );
      }),
    );
  }
}

