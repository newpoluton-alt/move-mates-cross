import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';

import '../../../../../config/theme/colors/green_color.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';
import '../../widgets/working_hours_calendar_page/working_hours_calendar_page_date_widget.dart';
import '../../widgets/working_hours_calendar_page/working_hours_calendar_page_calendar_widget.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';

class WorkingHoursCalendarPage extends StatefulWidget {
  const WorkingHoursCalendarPage({super.key});

  static const String id = 'working_hours_calendar_page';

  @override
  State<WorkingHoursCalendarPage> createState() =>
      _WorkingHoursCalendarPageState();
}

class _WorkingHoursCalendarPageState extends State<WorkingHoursCalendarPage> {
  late List<DateTime> _selectedDateTimes;

  void _addDateTime(DateTime dateTime) {
    setState(() {
      _selectedDateTimes.add(dateTime);
    });
  }

  void _removeDateTime(DateTime dateTime) {
    setState(() {
      _selectedDateTimes
          .removeWhere((element) => _isDatesSame(dateTime, element));
    });
  }

  void _sortSelectedTimes() {
    _selectedDateTimes.sort((a, b)=> a.compareTo(b));
  }

  bool _isDatesSame(DateTime dateOne, DateTime dateTwo) {
    bool isDaysSame = dateOne.day == dateTwo.day;
    bool isMonthsSame = dateOne.month == dateTwo.month;
    bool isYearsSame = dateOne.year == dateTwo.year;
    return isDaysSame && isMonthsSame && isYearsSame;
  }

  @override
  void initState() {
    _selectedDateTimes = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sortSelectedTimes();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 115.w,
        title: const Text('Выходные дни'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      backgroundColor: GreyColor.g8,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WorkingHoursCalendarPageCalendarWidget(
              isDatesSame: _isDatesSame,
              addDateTime: _addDateTime,
              removeDateTime: _removeDateTime,
              selectedDateTimes: _selectedDateTimes,
            ),
            SizedBox(height: 21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ..._selectedDateTimes.map((element) =>
                    WorkingHoursCalendarPageDateWidget(
                        dateTime: element, removeDateTime: _removeDateTime)),
                SizedBox(height: 50.h),
                AuthPageValidationButtonWidget(
                    name: 'Выбрать',
                    buttonBorderColor: GreenColor.g2,
                    buttonColor: GreenColor.g2,
                    textStyle: AppTextStyle.bold(
                      fontSize: 20.sp,
                      color: Colors.white,
                    )),
                SizedBox(height: 15.h),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
