import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_choose_your_training_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/coach_main_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

import '../wigets/choose_your_training_page/selected_dropdown_items_widget.dart';
import '../wigets/choose_your_training_page/training_session_dropdown_button_widget.dart';

class ChooseYourTrainingPage extends StatefulWidget {
  static const String id = 'choose_your_training_page';

  const ChooseYourTrainingPage({super.key});

  @override
  State<ChooseYourTrainingPage> createState() =>
      _ChooseYourTrainingPageState();
}

class _ChooseYourTrainingPageState
    extends State<ChooseYourTrainingPage> {
  GlobalKey<FormState> dropdownGlobalFormKey = GlobalKey<FormState>();
  late List<DropdownItemEntity> dropdownGroupItemEntityList;
  late List<DropdownItemEntity> dropdownIndividualItemEntityList;
  late List<DropdownItemEntity> dropdownGroupSelectedItemEntityList;
  late List<DropdownItemEntity> dropdownIndividualSelectedItemEntityList;

  @override
  void initState() {
    dropdownGroupSelectedItemEntityList = [];
    dropdownIndividualSelectedItemEntityList = [];
    dropdownGroupItemEntityList = _fromStringToDropdownItemEntityList();
    dropdownIndividualItemEntityList = _fromStringToDropdownItemEntityList();
    super.initState();
  }

  void _submitTextField() {
    if (!mounted) return;
    if (!dropdownGlobalFormKey.currentState!.validate()) return;
    dropdownGlobalFormKey.currentState!.save();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownItemEntity> _fromStringToDropdownItemEntityList() {
    return CoachPageConstants.coachTrainingType
        .map((e) => DropdownItemEntity(trainingType: e))
        .toList();
  }

  void _removeDropdownItem(
    DropdownItemEntity itemEntity,
    List<DropdownItemEntity> itemEntityList,
  ) {
    itemEntityList.removeWhere((element) {
      if (element == itemEntity) {
        setState(() {});
        return true;
      } else {
        return false;
      }
    });
  }

  void _addDropdownItem(
    DropdownItemEntity itemEntity,
    List<DropdownItemEntity> itemEntityList,
  ) {
    if (itemEntityList.every((element) => element != itemEntity)) {
      itemEntityList.add(itemEntity);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130.w,
        centerTitle: true,
        backgroundColor: GreyColor.g8,
        title: const Text('Специализации'),
        leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AssetIcon(path: IconPath.backButton, color: PinkColor.p3),
                Text(
                  'Главная',
                  style: CoachTrainingSessionTextStyle.backButtonText,
                )
              ],
            )),
        actions: [
          TextButton(
              onPressed: () {
                _submitTextField();
              },
              child: Text(
                'Готово',
                style: CoachTrainingSessionTextStyle.appBarDoneButtonTitle,
              ))
        ],
      ),
      backgroundColor: GreyColor.g8,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25.h,
              ),
              TrainingSessionDropdownButtonWidget(
                title: 'Индивидуальная',
                iconPath: IconPath.individualTraining,
                addDropdownItem: _addDropdownItem,
                removeDropdownItem: _removeDropdownItem,
                dropdownButtonItemEntityList: dropdownIndividualItemEntityList,
                dropdownButtonSelectedItemEntityList:
                    dropdownIndividualSelectedItemEntityList,
              ),
              SelectedDropdownItemsWidget(
                isGroup: false,
                removeDropdownItem: _removeDropdownItem,
                dropdownSelectedItemList:
                    dropdownIndividualSelectedItemEntityList,
              ),
              SizedBox(height: 20.h),
              TrainingSessionDropdownButtonWidget(
                title: 'Групповая',
                iconPath: IconPath.groupTraining,
                addDropdownItem: _addDropdownItem,
                removeDropdownItem: _removeDropdownItem,
                dropdownButtonItemEntityList: dropdownGroupItemEntityList,
                dropdownButtonSelectedItemEntityList:
                    dropdownGroupSelectedItemEntityList,
              ),
              Form(
                key: dropdownGlobalFormKey,
                child: SelectedDropdownItemsWidget(
                  isGroup: true,
                  removeDropdownItem: _removeDropdownItem,
                  dropdownSelectedItemList: dropdownGroupSelectedItemEntityList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownItemEntity extends Equatable {
  final String trainingType;

  const DropdownItemEntity({required this.trainingType});

  @override
  List<Object?> get props => [trainingType];
}
