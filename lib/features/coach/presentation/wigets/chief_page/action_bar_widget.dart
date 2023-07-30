
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors.dart';
import 'action_bar_button_widget.dart';

class ActionBarWidget extends StatefulWidget {
  final bool isFirstAction;
  final void Function() changeAction;

  const ActionBarWidget({
    super.key,
    required this.isFirstAction,
    required this.changeAction,
  });

  @override
  State<ActionBarWidget> createState() => _ActionBarWidgetState();
}

class _ActionBarWidgetState extends State<ActionBarWidget> {
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
                color: CoachColor.actionBarBackground,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          Row(
            children: [
              ActionBarButtonWidget(
                isFirstAction: widget.isFirstAction,
                changeAction: widget.changeAction,
                text: 'Тренировки',
              ),
              ActionBarButtonWidget(
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
