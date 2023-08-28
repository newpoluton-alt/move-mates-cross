import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../wigets/qualification_page/qualification_page_app_bar_back_button.dart';

class SubscriptionsPage extends StatefulWidget {
  static const String id = 'subscriptions_page';

  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('Подписки'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          child: Column(children: []),
        ),
      ),
    );
  }
}
