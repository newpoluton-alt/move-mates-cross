import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_clients_choose_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_creation_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/calendar/training_date_time_set_page.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';
import '../../widgets/training_options_set_page/training_options_set_page_move_to_next_page_widget.dart';
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

  String? _clients;
  String? _trainingType;
  String? _trainingDateTime;
  late DateTime _selectedDateTime;


  @override
  void initState() {
    _selectedDateTime =  DateTime.now().copyWith(
      minute: 0,
    );
    super.initState();
  }
  DateTime _acquireSelectedDateTime() =>
      _selectedDateTime;

  String? _acquireTrainingType() => _trainingType;

  String? _acquireTrainingDateTime() => _trainingDateTime;

  String? _acquireClients() => _clients;

  void _updateSelectedDateTime(DateTime dateTime) {
    setState(() {
      _selectedDateTime = dateTime.copyWith(minute: 0);
    });
  }

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

  TextStyle get _labelTextStyle => AppTextStyle.medium(
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
              Text('Дата и время', style: _labelTextStyle),
              SizedBox(height: 8.h),
              TrainingOptionsSetPageMoveToNextPageWidget(
                nextPage: TrainingDateTimeSetPage(
                  obtainDateTime: _acquireSelectedDateTime,
                  updateDateTime: _updateSelectedDateTime,
                  trainingDateTimeValue: _acquireTrainingDateTime,
                  updateTrainingDateTime: _updateTrainingDateTime,
                ),
                updateTitleValue: _updateTrainingDateTime,
                acquireTitleValue: _acquireTrainingDateTime,
              ),
              SizedBox(height: 25.h),
              Text('Клиент', style: _labelTextStyle),
              SizedBox(height: 8.h),
              TrainingOptionsSetPageMoveToNextPageWidget(
                nextPage: TrainingClientsChoosePage(
                  updateClients: _updateClients,
                  clientsValue: _acquireClients,
                  trainingType: widget.trainingCountType,
                ),
                updateTitleValue: _updateClients,
                acquireTitleValue: _acquireClients,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
