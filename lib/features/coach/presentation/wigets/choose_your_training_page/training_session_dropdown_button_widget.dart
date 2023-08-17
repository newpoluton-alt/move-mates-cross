import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_choose_your_training_text_style.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../user_auth/presentation/widgets/signup/asset_icon_widget.dart';
import '../../pages/choose_your_training_page.dart';
import 'dropdown_item_widget.dart';

class TrainingSessionDropdownButtonWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final List<DropdownItemEntity> dropdownButtonItemEntityList;
  final List<DropdownItemEntity> dropdownButtonSelectedItemEntityList;
  final void Function(
    DropdownItemEntity itemEntity,
    List<DropdownItemEntity> itemEntityList,
  ) addDropdownItem;
  final void Function(
    DropdownItemEntity itemEntity,
    List<DropdownItemEntity> itemEntityList,
  ) removeDropdownItem;

  const TrainingSessionDropdownButtonWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.addDropdownItem,
    required this.removeDropdownItem,
    required this.dropdownButtonItemEntityList,
    required this.dropdownButtonSelectedItemEntityList,
  });

  void _addConcreteDropdownItem(DropdownItemEntity itemEntity) {
    addDropdownItem(itemEntity, dropdownButtonSelectedItemEntityList);
  }
  void _removeConcreteDropdownItem(DropdownItemEntity itemEntity) {
    removeDropdownItem(itemEntity, dropdownButtonSelectedItemEntityList);
  }

  bool _isTrainingSelected(DropdownItemEntity itemEntity) {
    return dropdownButtonSelectedItemEntityList.contains(itemEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: 350.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.centerLeft,
        children: [
          AssetIcon(
            path: iconPath,
            color: PinkColor.p12,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 35.w),
            child: DropdownButton<DropdownItemEntity>(
              isExpanded: true,
              underline: const SizedBox(),
              onChanged: (Object? value) {},
              borderRadius: BorderRadius.circular(8.r),
              hint: Text(
                title,
                style: CoachTrainingSessionTextStyle.trainingSessionButton,
              ),
              icon: Icon(
                Icons.keyboard_arrow_up,
                color: GreyColor.g13,
                size: 20.w,
              ),
              items: dropdownButtonItemEntityList
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: DropdownItemWidget(
                        dropdownItemEntity: e,
                        addTrainings: _addConcreteDropdownItem,
                        isTrainingSelected: _isTrainingSelected,
                        removeTrainings: _removeConcreteDropdownItem,
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
