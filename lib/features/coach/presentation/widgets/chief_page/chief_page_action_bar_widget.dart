
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import 'chief_page_action_bar_button_widget.dart';

class ChiefPageActionBarWidget extends StatefulWidget {
  final bool isFirstAction;
  final void Function() changeAction;

  const ChiefPageActionBarWidget({
    super.key,
    required this.isFirstAction,
    required this.changeAction,
  });

  @override
  State<ChiefPageActionBarWidget> createState() => _ChiefPageActionBarWidgetState();
}

class _ChiefPageActionBarWidgetState extends State<ChiefPageActionBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: GreyColor.g5,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          Row(
            children: [
              ChiefPageActionBarButtonWidget(
                isFirstAction: widget.isFirstAction,
                changeAction: widget.changeAction,
                text: 'Тренировки',
              ),
              ChiefPageActionBarButtonWidget(
                isFirstAction: !widget.isFirstAction,
                changeAction: widget.changeAction,
                text: 'Действия',
              )
            ],
          ),
        ],
      ),
    );
  }
}
