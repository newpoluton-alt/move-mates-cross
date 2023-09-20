import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/coach/presentation/widgets/training_creation_page/training_creation_page_training_type_button_widget.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';

class TrainingCreationPage extends StatefulWidget {
  static const String id = 'training_creation_page';

  const TrainingCreationPage({super.key});

  @override
  State<TrainingCreationPage> createState() => _TrainingCreationPageState();
}

class _TrainingCreationPageState extends State<TrainingCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('Новое событие'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            SizedBox(height: 30.h),
            const TrainingCreationPageTrainingTypeButtonWidget(trainingType:TrainingType.individual,),
            SizedBox(height: 10.h),
            const TrainingCreationPageTrainingTypeButtonWidget(trainingType:TrainingType.group,)
          ]),
        ),
      ),
    );
  }
}

enum TrainingType { individual, group }
