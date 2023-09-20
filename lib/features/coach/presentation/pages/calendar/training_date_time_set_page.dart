import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';

class TrainingDateTimeSetPage extends StatefulWidget {

  const TrainingDateTimeSetPage({super.key});

  @override
  State<TrainingDateTimeSetPage> createState() => _TrainingDateTimeSetPageState();
}

class _TrainingDateTimeSetPageState extends State<TrainingDateTimeSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('Дата и время'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: []),
        ),
      ),
    );
  }
}
