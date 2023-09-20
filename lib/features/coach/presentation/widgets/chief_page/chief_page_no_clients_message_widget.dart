

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../core/constants/coach/coach_page_constants.dart';
import 'chief_page_no_clients_message_content_widget.dart';

class ChiefPageNoClientsMessageWidget extends StatefulWidget {
  const ChiefPageNoClientsMessageWidget({super.key});

  @override
  State<ChiefPageNoClientsMessageWidget> createState() =>
      _ChiefPageNoClientsMessageWidgetState();
}

class _ChiefPageNoClientsMessageWidgetState
    extends State<ChiefPageNoClientsMessageWidget> {
  late int _elementIndex;
  late List<String> _coachHasNoClientsMessages;
  late PageController _pageController;

  @override
  void initState() {
    _elementIndex = 0;
    _pageController = PageController();
    _pageController.addListener(() {});
    _coachHasNoClientsMessages =
        List.from(CoachPageConstants.coachHasNoClientsMessages);
    super.initState();
  }

  void _updateIndex(int newIndex) {
    setState(() {
      _elementIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 350.w,
          height: 203.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (newIndex)=>_updateIndex(newIndex),
            scrollDirection: Axis.horizontal,
            itemCount: _coachHasNoClientsMessages.length,
            itemBuilder: (context, index) {
              return ChiefPageNoClientsMessageContentWidget(
                title: _coachHasNoClientsMessages[index],
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 30.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _coachHasNoClientsMessages
                .map((element) =>
                Container(
                  height: 12.r,
                  width: 12.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: (_elementIndex ==
                        _coachHasNoClientsMessages.indexOf(element))
                        ? PinkColor.p6
                        : GreyColor.g4,
                  ),
                ))
                .toList(),
          ),
        )
      ],
    );
  }
}

