import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'client_profile_page_trainings_tab_bar_widget.dart';

class ClientProfilePageComingAndPastTrainings extends StatefulWidget {
  final bool Function() alternationValue;
  final void Function(bool value) defineAlternationValue;

  const ClientProfilePageComingAndPastTrainings({
    super.key,
    required this.alternationValue,
    required this.defineAlternationValue,
  });

  @override
  State<ClientProfilePageComingAndPastTrainings> createState() =>
      _ClientProfilePageComingAndPastTrainingsState();
}

class _ClientProfilePageComingAndPastTrainingsState
    extends State<ClientProfilePageComingAndPastTrainings> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClientProfilePageTrainingsTabBarWidget(
          alternationValue: widget.alternationValue,
          changeAlternationValue: widget.defineAlternationValue,
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}

class ClientProfilePageTrainingModel {
  final String type;
  final String place;
  final DateTime trainingDateTime;

  ClientProfilePageTrainingModel({
    required this.type,
    required this.place,
    required this.trainingDateTime,
  });
}
