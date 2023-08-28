
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/app_text_style.dart';

class NotificationsPageElementWidget extends StatefulWidget {
  final String title;

  const NotificationsPageElementWidget({
    super.key,
    required this.title,
  });

  @override
  State<NotificationsPageElementWidget> createState() =>
      _NotificationPagesElementWidgetState();
}

class _NotificationPagesElementWidgetState
    extends State<NotificationsPageElementWidget> {
  late bool _isEnabled;

  @override
  void initState() {
    _isEnabled = false;
    super.initState();
  }

  void _changeIsEnabledValue(bool value) {
    setState(() {
      _isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: AppTextStyle.medium(
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
          Switch(
            value: _isEnabled,
            onChanged: _changeIsEnabledValue,
          )
        ],
      ),
    );
  }
}
