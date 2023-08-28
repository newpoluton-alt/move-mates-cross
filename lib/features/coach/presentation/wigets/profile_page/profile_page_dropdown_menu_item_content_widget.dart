import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/app_text_style.dart';

class ProfilePageDropdownMenuItemContentWidget extends StatelessWidget {
  final String element;
  final List<String> selectedCoachLanguages;
  final void Function(String language) addLanguage;
  final void Function(String language) removeLanguage;

  const ProfilePageDropdownMenuItemContentWidget({
    super.key,
    required this.selectedCoachLanguages,
    required this.removeLanguage,
    required this.addLanguage,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        onTap: () {
          if (selectedCoachLanguages.contains(element)) {
            removeLanguage(element);
          } else {
            addLanguage(element);
          }
          setState(() {});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              element,
              style: AppTextStyle.normal(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            Checkbox(
                value: selectedCoachLanguages.contains(element),
                activeColor: Colors.black,
                onChanged: (value) {
                  if (!(value ?? false)) {
                    removeLanguage(element);
                  } else {
                    addLanguage(element);
                  }
                  setState(() {});
                })
          ],
        ),
      );
    });
  }
}


