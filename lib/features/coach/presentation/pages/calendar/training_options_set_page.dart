import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_clients_choose_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_creation_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_date_time_set_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';
import '../../widgets/training_options_set_page/training_options_set_page_training_type_dropdown_widget.dart';

class TrainingOptionsSetPage extends StatefulWidget {
  final TrainingType trainingCountType;


  const TrainingOptionsSetPage({
    super.key,
    required this.trainingCountType,
  });

  @override
  State<TrainingOptionsSetPage> createState() => _TrainingOptionsSetPageState();
}

class _TrainingOptionsSetPageState extends State<TrainingOptionsSetPage> {
  String? _trainingType;
  String? _trainingDateTime;
  String? _clients;


  String? _acquireTrainingType() => _trainingType;

  String? _acquireTrainingDateTime() => _trainingDateTime;

  String? _acquireClients() => _clients;

  void _updateTrainingType(String? value) {
    if (value == null) return;
    setState(() {
      _trainingType = value;
    });
  }

  void _updateTrainingDateTime(String? value) {
    if (value == null) return;
    setState(() {
      _trainingDateTime = value;
    });
  }

  void _updateClients(String? value) {
    if (value == null) return;
    setState(() {
      _clients = value;
    });
  }


  bool get _isIndividualTraining =>
      widget.trainingCountType == TrainingType.individual;

  String get _determinePageTitleDueTrainingType =>
      _isIndividualTraining ? 'Индивидуальная' : 'Группа';

  TextStyle get _labelTextStyle =>
      AppTextStyle.medium(
        fontSize: 15.sp,
        color: GreyColor.g9,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: Text(_determinePageTitleDueTrainingType),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text('Специализация', style: _labelTextStyle),
              SizedBox(height: 8.h),
              TrainingOptionsSetPageTrainingTypeDropdownWidget(
                  trainingTypeValue: _acquireTrainingType,
                  updateTrainingType: _updateTrainingType),

              SizedBox(height: 25.h),
              Text('Специализация', style: _labelTextStyle),
              SizedBox(height: 8.h),
              TrainingOptionsSetPageMoveToNextPageWidget(
                nextPage: const TrainingDateTimeSetPage(),
                updateTitleValue: _updateTrainingDateTime,
                acquireTitleValue: _acquireTrainingDateTime,),

              SizedBox(height: 25.h),
              Text('Специализация', style: _labelTextStyle),
              SizedBox(height: 8.h),
              TrainingOptionsSetPageMoveToNextPageWidget(
                nextPage: const TrainingClientsChoosePage(),
                updateTitleValue: _updateClients,
                acquireTitleValue: _acquireClients,),

            ],
          ),
        ),
      ),
    );
  }
}


class TrainingOptionsSetPageMoveToNextPageWidget extends StatelessWidget {
  final Widget nextPage;
  final String? Function() acquireTitleValue;
  final void Function(String value) updateTitleValue;

  const TrainingOptionsSetPageMoveToNextPageWidget({
    super.key,
    required this.nextPage,
    required this.updateTitleValue,
    required this.acquireTitleValue,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => nextPage),);
        },
        child: Container(
          height: 56.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: GreyColor.g19),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                acquireTitleValue() ?? 'Выбрать',
                style: AppTextStyle.normal(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SignupPageAssetIconWidget(path: IconPath.forwardArrow,color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}
