
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_calendar_text_style.dart';
import '../../../../user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';
import '../../pages/calendar/training_creation_page.dart';

class CalendarPageCreateTrainingButton extends StatelessWidget {
  const CalendarPageCreateTrainingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: () {
          Navigator.of(context).pushNamed(TrainingCreationPage.id);
        },

        child: Container(
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: GreyColor.g19)),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Добавить тренировку',
                style: CoachCalendarTextStyle.calendarAddTrainingTitle,
              ),
              SizedBox(width: 70.w),
              SignupPageAssetIconWidget(path: IconPath.add, size: 30)
            ],
          ),
        ),
      ),
    );
  }
}
