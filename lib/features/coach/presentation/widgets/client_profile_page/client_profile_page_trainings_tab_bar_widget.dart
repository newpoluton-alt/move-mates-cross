import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import 'client_profile_page_trainings_button_widget.dart';

class ClientProfilePageTrainingsTabBarWidget extends StatelessWidget {
  final bool Function() alternationValue;
  final void Function(bool value) changeAlternationValue;

  const ClientProfilePageTrainingsTabBarWidget(
      {super.key,
      required this.alternationValue,
      required this.changeAlternationValue});

  Color _buttonColor(bool isNotPushed) {
    return isNotPushed ? Colors.white : Colors.black;
  }

  Color _textColor(bool isNotPushed) {
    return isNotPushed ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: PinkColor.p26,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClientProfilePageTrainingsButtonWidget(
                  title: 'Предстоящие',
                  textColor: _textColor(alternationValue()),
                  backgroundColor: _buttonColor(alternationValue()),
                  changeValueOfButtonAlternation: () {
                    changeAlternationValue(false);
                    setState(() {});
                  }),
              SizedBox(width: 5.w),
              ClientProfilePageTrainingsButtonWidget(
                  title: 'Прошедшие',
                  textColor: _textColor(!alternationValue()),
                  backgroundColor: _buttonColor(!alternationValue()),
                  changeValueOfButtonAlternation: () {
                    changeAlternationValue(true);
                    setState(() {});
                  }),
            ],
          ));
    });
  }
}
