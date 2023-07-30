import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_training_session_text_style.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

class TrainingSessionCreationPage extends StatefulWidget {
  static const String id = 'training_session_creation_page';

  const TrainingSessionCreationPage({super.key});

  @override
  State<TrainingSessionCreationPage> createState() =>
      _TrainingSessionCreationPageState();
}

class _TrainingSessionCreationPageState
    extends State<TrainingSessionCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130.w,
        leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AssetIcon(
                    path: IconPath.backButton,
                    color: AppViewColor.indicatorSelected),
                Text(
                  'Главная',
                  style: CoachTrainingSessionTextStyle.backButtonText,
                )
              ],
            )),
        title: const Text('Расписание'),
        backgroundColor: CoachColor.scaffoldBackground,
      ),
      backgroundColor: CoachColor.scaffoldBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40.h,),
            TrainingSessionButtonWidget(
              title: 'Индивидуальная',
              iconPath: IconPath.individualTraining,
            ),
            SizedBox(
              height: 10.h,
            ),
            TrainingSessionButtonWidget(
              title: 'Групповая',
              iconPath: IconPath.groupTraining,
            ),
            SizedBox(height: 40.h,),
            Text(
              'Рабочие часы',
              style: CoachTrainingSessionTextStyle.workingHoursTitle,
            ),
            TrainingSessionButtonWidget(
              title: 'Добавить',
              arrowIconColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingSessionButtonWidget extends StatelessWidget {
  String? iconPath;
  Color? arrowIconColor;
  final String title;

  TrainingSessionButtonWidget({
    super.key,
    required this.title,
    this.arrowIconColor,
    this.iconPath,
  });

  bool get isIconPathNull => (iconPath == null);

  bool get isIconColorNull => (arrowIconColor == null);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 54.h,
      minWidth: 350.w,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      color: Colors.white,
      child: Row(
        children: [
          isIconPathNull
              ? const SizedBox()
              : AssetIcon(
                  path: iconPath!,
                  color: CoachColor.trainingSessionIcon,
                  size: 30,
                ),
          SizedBox(width: 9.w),
          Text(
            title,
            style: CoachTrainingSessionTextStyle.trainingSessionButton,
          ),
          const Expanded(child: SizedBox()),
          AssetIcon(
            path: IconPath.forwardArrow,
            size: 15,
            color: isIconColorNull ? null : arrowIconColor,
          )
        ],
      ),
    );
  }
}
