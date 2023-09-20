import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import 'client_profile_page_coming_and_past_trainings_widget.dart';

class ClientProfilePageTrainingsFiltererWidget extends StatefulWidget {
  final bool Function() alternationValue;

  const ClientProfilePageTrainingsFiltererWidget(
      {super.key, required this.alternationValue});

  @override
  State<ClientProfilePageTrainingsFiltererWidget> createState() =>
      _ClientProfilePageTrainingsFiltererWidgetState();
}

class _ClientProfilePageTrainingsFiltererWidgetState
    extends State<ClientProfilePageTrainingsFiltererWidget> {
  late final TrainingsFiltererNotifier filtererNotifier;

  @override
  void initState() {
    filtererNotifier = TrainingsFiltererNotifier();
    filtererNotifier.addTrainings();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ClientProfilePageTrainingModel>>(
        valueListenable: filtererNotifier.trainings,
        builder: (context, value, _) {
          if (value.isNotEmpty) {
            return Column(
              children: [
                ...filtererNotifier
                    .postOrUpcoming(widget.alternationValue())
                    .map((element) => TrainingCardWidget(model: element))
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class TrainingCardWidget extends StatelessWidget {
  final ClientProfilePageTrainingModel model;

  const TrainingCardWidget({
    super.key,
    required this.model,
  });

  String get _formattedDate {
    return DateFormat('EE, dd MMMM', 'ru').format(model.trainingDateTime);
  }

  String _formattedTimeOfDay(BuildContext context) {
    return TimeOfDay.fromDateTime(model.trainingDateTime).format(context);
  }

  Widget _buildDivider() {
    return Container(
      width: 1.w,
      color: PinkColor.p9,
      height: 21.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
    );
  }

  TextStyle get _trainingDescriptionStyle {
    return AppTextStyle.medium(fontSize: 16.sp, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: PinkColor.p26,
              offset: Offset(0, 2.h),
              blurRadius: 2.r,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SignupPageAssetIconWidget(
                path: IconPath.done,
                color: PinkColor.p9,
                size: 28,
              ),
              SizedBox(width: 6.w),
              Text(
                model.type,
                style: AppTextStyle.medium(
                  fontSize: 15.sp,
                  color: PinkColor.p24,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                _formattedDate,
                style: _trainingDescriptionStyle,
              ),
              _buildDivider(),
              Text(
                _formattedTimeOfDay(context),
                style: _trainingDescriptionStyle,
              ),
              _buildDivider(),
              Text(
                model.place,
                style: _trainingDescriptionStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}

class TrainingsFiltererNotifier {
  ValueNotifier<List<ClientProfilePageTrainingModel>> trainings =
      ValueNotifier([]);

  void addTrainings() {
    if (trainings.value.isEmpty) {
      trainings.value.addAll(_executeArithmeticalOperation(_add));
      trainings.value.addAll(_executeArithmeticalOperation(_subtract));
    }
  }

  List<ClientProfilePageTrainingModel> postOrUpcoming(bool alternationValue) {
    return alternationValue
        ? _acquireUpcomingTrainings()
        : _acquirePastTrainings();
  }

  List<ClientProfilePageTrainingModel> _acquireUpcomingTrainings() {
    return trainings.value
        .where((e) => e.trainingDateTime.isBefore(DateTime.now()))
        .toList();
  }

  List<ClientProfilePageTrainingModel> _acquirePastTrainings() {
    return trainings.value
        .where((e) => e.trainingDateTime.isAfter(DateTime.now()))
        .toList();
  }

  DateTime _add(Duration duration) {
    return DateTime.now().add(duration);
  }

  DateTime _subtract(Duration duration) {
    return DateTime.now().subtract(duration);
  }

  List<ClientProfilePageTrainingModel> _executeArithmeticalOperation(
      DateTime Function(Duration duration) operation) {
    return List<ClientProfilePageTrainingModel>.generate(
        3,
        (index) => ClientProfilePageTrainingModel(
            type: 'Группа',
            place: 'Онлайн',
            trainingDateTime:
                operation(Duration(days: index + 1, hours: index + 1))));
  }
}
