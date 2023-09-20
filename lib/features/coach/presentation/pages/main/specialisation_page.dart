import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_choose_your_training_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../widgets/specialisation_page/specialisation_page_selected_dropdown_items_widget.dart';
import '../../widgets/specialisation_page/specialisation_page_training_session_dropdown_button_widget.dart';

class SpecialisationPage extends StatefulWidget {
  static const String id = 'specialisation_page';

  const SpecialisationPage({super.key});

  @override
  State<SpecialisationPage> createState() =>
      _SpecialisationPageState();
}

class _SpecialisationPageState
    extends State<SpecialisationPage> {
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
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SignupPageAssetIconWidget(path: IconPath.backButton, color: PinkColor.p3),
                Text(
                  'Назад',
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
              SpecialisationPageTrainingSessionDropdownButtonWidget(
                title: 'Индивидуальная',
                iconPath: IconPath.individualTraining,
                addDropdownItem: _addDropdownItem,
                removeDropdownItem: _removeDropdownItem,
                dropdownButtonItemEntityList: dropdownIndividualItemEntityList,
                dropdownButtonSelectedItemEntityList:
                    dropdownIndividualSelectedItemEntityList,
              ),
              SpecialisationPageSelectedDropdownItemsWidget(
                isGroup: false,
                removeDropdownItem: _removeDropdownItem,
                dropdownSelectedItemList:
                    dropdownIndividualSelectedItemEntityList,
              ),
              SizedBox(height: 20.h),
              SpecialisationPageTrainingSessionDropdownButtonWidget(
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
                child: SpecialisationPageSelectedDropdownItemsWidget(
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
