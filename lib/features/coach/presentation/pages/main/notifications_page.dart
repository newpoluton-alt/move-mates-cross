import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/notifications_page/notification_page_element_widget.dart';
import '../../widgets/notifications_page/notifications_page_divider_widget.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';

class NotificationsPage extends StatefulWidget {
  static const String id = 'notifications_page';

  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g8,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 115.w,
        title: const Text('Уведомления'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            const NotificationsPageElementWidget(title: 'Показывать на экране'),
            SizedBox(height: 5.h),
            Text('Отображать уведомления при блокировке устройства.',
                style:
                    AppTextStyle.medium(fontSize: 12.sp, color: GreyColor.g28)),
            SizedBox(height: 25.h),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NotificationsPageElementWidget(
                        title: 'Напоминания о тренировках'),
                    NotificationsPageDividerWidget(),
                    NotificationsPageElementWidget(
                        title: 'Отчеты о плане питания'),
                    NotificationsPageDividerWidget(),
                    NotificationsPageElementWidget(title: 'Платежи от клиентов'),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
