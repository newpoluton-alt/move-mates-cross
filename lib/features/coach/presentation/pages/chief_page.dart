import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_home_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

import '../wigets/chief_page/action_bar_widget.dart';
import '../wigets/chief_page/calendar_tab_widget.dart';

class ChiefPage extends StatefulWidget {
  const ChiefPage({super.key});

  @override
  State<ChiefPage> createState() => _ChiefPageState();
}

class _ChiefPageState extends State<ChiefPage> {
  late DateFormat dayFormat;
  late DateFormat dMYFormat;
  late DateFormat weekDayFormat;
  late List<DateTime> temp;
  late bool isFirstAction;

  @override
  void initState() {
    initializeDateFormatting();
    weekDayFormat = DateFormat.E('ru');
    dayFormat = DateFormat.d('ru');
    dMYFormat = DateFormat.yMEd('ru');
    temp =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    isFirstAction = true;
    super.initState();
  }

  bool get isFirstActionValue => isFirstAction;
int get actionWidgetIndex => isFirstActionValue? 0: 1;
  void changeAction() {
    setState(() {
      isFirstAction = !isFirstAction;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'Доброе утро, Умар',
                  style: CoachHomeTextStyle.greeting,
                ),
                IconButton(
                    onPressed: () {},
                    icon: AssetIcon(
                      path: IconPath.setting,
                      color: CoachColor.settingIcon,
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CalendarTabWidget(
              temp: temp,
              weekDayFormat: weekDayFormat,
              dayFormat: dayFormat,
              dMYFormat: dMYFormat,
            ),
            SizedBox(height: 22.h),
            ActionBarWidget(
                isFirstAction: isFirstActionValue, changeAction: changeAction),
            SizedBox(height: 30.h),
            CoachPageConstants.coachActionWidgetsList[actionWidgetIndex],

          ],
        ),
      ),
    );
  }
}
