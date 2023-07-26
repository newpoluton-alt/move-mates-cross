import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_home_text_style.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

import '../wigets/home_page/calendar_tab_widget.dart';

class ChiefPage extends StatefulWidget {
  const ChiefPage({super.key});

  @override
  State<ChiefPage> createState() => _ChiefPageState();
}

class _ChiefPageState extends State<ChiefPage> {
  late DateFormat dayFormat;
  late DateFormat weekDayFormat;
  late List<DateTime> temp;
  late   bool isFirstAction;

  @override
  void initState() {
    initializeDateFormatting();
    weekDayFormat = DateFormat.E('ru');
    dayFormat = DateFormat.d('ru');
    temp =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    isFirstAction = true;
    super.initState();
  }


  bool get isFirstActionValue => isFirstAction;

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
                    icon: const AssetIcon(
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
            ),
            SizedBox(height: 22.h),
            ActionBarWidget(isFirstAction: isFirstActionValue, changeAction: changeAction),
          ],
        ),
      ),
    );
  }
}

class ActionBarWidget extends StatefulWidget {
  final bool isFirstAction;
  final void Function() changeAction;

  const ActionBarWidget({
    super.key,
    required this.isFirstAction,
    required this.changeAction,
  });

  @override
  State<ActionBarWidget> createState() => _ActionBarWidgetState();
}

class _ActionBarWidgetState extends State<ActionBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: CoachColor.actionBarBackground,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          Row(
            children: [
              ActionBarButtonWidget(
                isFirstAction: widget.isFirstAction,
                changeAction: widget.changeAction,
                text: 'Тренировки',
              ),
              ActionBarButtonWidget(
                isFirstAction: !widget.isFirstAction,
                changeAction: widget.changeAction,
                text: 'Действия',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ActionBarButtonWidget extends StatelessWidget {
  const ActionBarButtonWidget({
    super.key,
    required this.isFirstAction,
    required this.changeAction,
    required this.text,
  });

  final void Function() changeAction;
  final bool isFirstAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
      elevation: isFirstAction ? 5 : 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isFirstAction ? Colors.white : Colors.transparent),
          borderRadius: BorderRadius.circular(8.r)),
      onPressed: isFirstAction ? () {} : changeAction,
      color: isFirstAction
          ? CoachColor.actionBarSelected
          : CoachColor.actionBarBackground,
      child: Text(
        text,
        style: isFirstAction
            ? CoachHomeTextStyle.actionBarSelected
            : CoachHomeTextStyle.actionBarUnselected,
      ),
    ));
  }
}
