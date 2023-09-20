import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../../core/constants/coach/coach_page_constants.dart';
import 'about_training_page_client_info_dropdown_item_widget.dart';

class AboutTrainingPageDropdownButtonWidget extends StatefulWidget {
  final CoachUpComingContentEntity coachUpComingContentEntity;

  const AboutTrainingPageDropdownButtonWidget({
    super.key,
    required this.coachUpComingContentEntity,
  });

  @override
  State<AboutTrainingPageDropdownButtonWidget> createState() =>
      _AboutTrainingPageDropdownButtonWidgetState();
}

class _AboutTrainingPageDropdownButtonWidgetState
    extends State<AboutTrainingPageDropdownButtonWidget> {
  late AboutTrainingPageDropdownModelNotifier modelNotifier;

  @override
  void initState() {
    modelNotifier = AboutTrainingPageDropdownModelNotifier();
    super.initState();
  }

  @override
  void dispose() {
    modelNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _dropdownOrChangedStatus(modelNotifier);
  }

  Widget _dropdownOrChangedStatus(
      AboutTrainingPageDropdownModelNotifier modelNotifier) {
    return ValueListenableBuilder<AboutTrainingPageDropdownElementModel?>(
        valueListenable: modelNotifier.model, builder: (context, value, _) {
      if (value == null) {
        return _dropdownButton(
            modelNotifier.defineAboutTrainingPageDropdownElementModel);
      }
      else {
        return Text(value.title, style: AppTextStyle.semiBold(
            fontSize: 11.sp, color: value.textColor),
        );
      }
    });
  }

  Widget _dropdownButton(
      ValueChanged<AboutTrainingPageDropdownElementModel> defineModel) {
    return Container(
      height: 23.h,
      width: 77.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: PinkColor.p23, borderRadius: BorderRadius.circular(5.r)),
      child: DropdownButton(
        value: null,
        isExpanded: true,
        icon: const SizedBox(),
        underline: const SizedBox(),
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(5.r),
        hint: Text(
          'Изменить',
          style: AppTextStyle.medium(fontSize: 12.sp, color: Colors.white),
        ),
        isDense: true,
        items: CoachPageConstants.aboutTrainingPageDropdownButtonItemList
            .map((element) =>
            DropdownMenuItem(
                value: element,
                enabled: false,
                child: AboutTrainingPageClientInfoDropdownItemWidget(
                  model: element,
                  onTap: () =>
                      element.onTap(
                          context: context,
                          defineModel: defineModel,
                          coachUpComingContentEntity:
                          widget.coachUpComingContentEntity),
                )))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}

class AboutTrainingPageDropdownElementModel {
  final String title;
  final Color textColor;

  const AboutTrainingPageDropdownElementModel({
    required this.title,
    required this.textColor,
  });
}

class AboutTrainingPageDropdownModelNotifier {
  ValueNotifier<AboutTrainingPageDropdownElementModel?> model = ValueNotifier(
      null);


  void defineAboutTrainingPageDropdownElementModel(
      AboutTrainingPageDropdownElementModel value) {
    model.value = value;
  }

  void dispose() {
    model.dispose();
  }
}
