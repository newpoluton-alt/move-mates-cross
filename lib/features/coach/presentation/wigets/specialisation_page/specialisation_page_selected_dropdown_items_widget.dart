import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/coach/coach_choose_your_training_text_style.dart';
import '../../pages/chief/specialisation_page.dart';

class SpecialisationPageSelectedDropdownItemsWidget extends StatelessWidget {
  final bool isGroup;
  final List<DropdownItemEntity> dropdownSelectedItemList;
  final void Function(DropdownItemEntity itemEntity,
      List<DropdownItemEntity> itemEntityList) removeDropdownItem;

  const SpecialisationPageSelectedDropdownItemsWidget({
    super.key,
    required this.isGroup,
    required this.removeDropdownItem,
    required this.dropdownSelectedItemList,
  });

  OutlineInputBorder get _customOutlineInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: GreyColor.g19));

  OutlineInputBorder get _customOutlineErrorInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: PinkColor.p15));

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: dropdownSelectedItemList
            .map((e) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 56.h,
                      margin: EdgeInsets.only(top: 12.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: GreyColor.g19),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.trainingType,
                              style: CoachTrainingSessionTextStyle
                                  .trainingTypeDropdownItemTitle,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {});
                                  removeDropdownItem(
                                      e, dropdownSelectedItemList);
                                },
                                icon: SignupPageAssetIconWidget(
                                  path: IconPath.trash,
                                  size: 22,
                                ))
                          ],
                        ),
                      ),
                    ),
                    isGroup
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              width: 158.w,
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    int typedNum =
                                        int.tryParse(value ?? '') ?? 0;

                                    if (typedNum <= 0 || typedNum >= 50) {
                                      return 'Заполните Мax кол-во человек';
                                    }
                                    return null;
                                  },

                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'Написать',
                                    helperText: 'Мax кол-во человек',
                                    fillColor: Colors.white,
                                    errorStyle:
                                        CoachTrainingSessionTextStyle
                                            .dropdownTextFieldSubtitleError,
                                    helperMaxLines: 2,
                                    errorMaxLines: 2,
                                    helperStyle:
                                        CoachTrainingSessionTextStyle
                                            .dropdownTextFieldSubtitle,
                                    enabledBorder:
                                        _customOutlineInputBorder,
                                    focusedBorder:
                                        _customOutlineInputBorder,
                                    errorBorder:
                                        _customOutlineErrorInputBorder,
                                    focusedErrorBorder:
                                        _customOutlineErrorInputBorder,
                                    hintStyle: CoachTrainingSessionTextStyle
                                        .dropdownTextFieldLabel,
                                  )),
                            ),
                          ],
                        )
                        : const SizedBox()
                  ],
                ))
            .toList(),
      );
    });
  }
}
