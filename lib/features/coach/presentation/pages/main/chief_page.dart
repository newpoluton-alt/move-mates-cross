import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_home_text_style.dart';
import 'package:move_mates_android/features/coach/coach_injection_container.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_get_client_list_cubit.dart';
import 'package:move_mates_android/features/coach/presentation/pages/main/settings_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/theme/colors/blue_color.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_custom_snackbar_builder.dart';
import '../../cubit/coach_cubit.dart';
import '../../cubit/coach_state.dart';
import '../../widgets/chief_page/chief_page_action_bar_widget.dart';
import '../../widgets/chief_page/chief_page_calendar_tab_widget.dart';
import '../../widgets/chief_page/chief_page_deeplink_and_fill_profile_widget.dart';
import '../../widgets/chief_page/chief_page_training_action_widget.dart';
import '../coach_main_page.dart';

class ChiefPage extends StatefulWidget implements CoachPage {
  const ChiefPage({super.key});

  @override
  State<ChiefPage> createState() => _ChiefPageState();

  @override
  String pageNameValue() {
    return pageName;
  }

  static const String pageName = 'Главная';
}

class _ChiefPageState extends State<ChiefPage> {
  late DateFormat _dayFormat;
  late DateFormat _dMYFormat;
  late DateFormat _weekDayFormat;
  late List<DateTime> _dateTimeList;
  late bool _isFirstAction;
  late String _currentDate;
  late DateFormat _coachCustomDateFormat;

  @override
  void initState() {
    initializeDateFormatting();
    _coachCustomDateFormat = DateFormat('yyyy-MM-dd', 'ru');
    _weekDayFormat = DateFormat.E('ru');
    _dayFormat = DateFormat.d('ru');
    _dMYFormat = DateFormat.yMEd('ru');
    _currentDate = _coachCustomDateFormat.format(DateTime.now());
    _dateTimeList =
        List.generate(30, (index) => DateTime.now().add(Duration(days: index)));
    _isFirstAction = true;
    super.initState();
  }

  @override
  void dispose() {
    sl<CoachCubit>().close();
    sl<CoachGetClientListCubit>().close();
    super.dispose();
  }

  bool get _isFirstActionValue => _isFirstAction;
  String get _currentDateValue => _currentDate;
  set _putNewCurrentDate(String newCurrentDate) => _currentDate = newCurrentDate;

  void changeCurrentDate(String newCurrentDate) {
    setState(() {
      _putNewCurrentDate = newCurrentDate;
    });
  }

  void changeAction() {
    setState(() {
      _isFirstAction = !_isFirstAction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoachCubit>(
          create: (_) => sl<CoachCubit>()
            ..onGetUpComings(
              UpComingParam(
                fromDate: _currentDateValue,
                size: 999,
                page: 0,
              ),
            ),
        ),
        BlocProvider<CoachGetClientListCubit>(
            create: (_) => sl<CoachGetClientListCubit>()
              ..onGetClientsList(ClientsListParam(size: 50, page: 0)))
      ],
      child: BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {
        if (state is CoachStateError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context)
                .showSnackBar(buildAuthPageCustomSnackBar(state.error));
          });
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        'Доброе утро, Умар',
                        overflow: TextOverflow.ellipsis,
                        style: CoachHomeTextStyle.greeting,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(SettingsPage.id);
                        },
                        icon: SignupPageAssetIconWidget(
                          path: IconPath.setting,
                          color: BlueColor.b2,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ChiefPageCalendarTabWidget(
                  temp: _dateTimeList,
                  changeCurrentDate: changeCurrentDate,
                  coachCustomDateFormat: _coachCustomDateFormat,
                  currentDate: _currentDateValue,
                  weekDayFormat: _weekDayFormat,
                  dayFormat: _dayFormat,
                  dMYFormat: _dMYFormat,
                ),
                SizedBox(height: 22.h),
                ChiefPageActionBarWidget(
                    isFirstAction: _isFirstActionValue,
                    changeAction: changeAction),
                SizedBox(height: 25.h),
                _isFirstAction
                    ? ChiefPageTrainingActionWidget(
                        currentDate: _currentDate,
                        coachCustomDateFormat: _coachCustomDateFormat,
                      )
                    : const ChiefPageDeeplinkAndFillProfileWidget(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
