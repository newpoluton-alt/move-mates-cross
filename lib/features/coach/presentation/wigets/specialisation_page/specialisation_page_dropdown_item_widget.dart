import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/coach/coach_choose_your_training_text_style.dart';
import '../../pages/chief/specialisation_page.dart';

class SpecialisationPageDropdownItemWidget extends StatelessWidget {
  final void Function(
    DropdownItemEntity itemEntity,
  ) addTrainings;
  final void Function(
    DropdownItemEntity itemEntity,
  ) removeTrainings;
  final DropdownItemEntity dropdownItemEntity;
  final bool Function(DropdownItemEntity itemEntity) isTrainingSelected;

  const SpecialisationPageDropdownItemWidget({
    super.key,
    required this.addTrainings,
    required this.removeTrainings,
    required this.dropdownItemEntity,
    required this.isTrainingSelected,
  });

  void _eitherAddOrRemoveDropdownButton(DropdownItemEntity itemEntity) {
    if(isTrainingSelected(itemEntity)) {
      removeTrainings(itemEntity);
    }
    else {
      addTrainings(itemEntity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SizedBox(
        height: 52.h,
        child: InkWell(
          onTap: () {
            _eitherAddOrRemoveDropdownButton(dropdownItemEntity);
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dropdownItemEntity.trainingType,
                style:
                    CoachTrainingSessionTextStyle.trainingTypeDropdownItemTitle,
              ),
              Checkbox(
                  value: isTrainingSelected(dropdownItemEntity),
                  activeColor: Colors.black,
                  onChanged: (value) {
                    _eitherAddOrRemoveDropdownButton(dropdownItemEntity);
                    setState(() {});
                  })
            ],
          ),
        ),
      );
    });
  }
}
