import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup_page/signup_page_asset_icon_widget.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import 'profile_page_dropdown_menu_item_content_widget.dart';

class ProfilePageLanguagesDropdownWidget extends StatelessWidget {
  final List<String> coachLanguages;
  final List<String> selectedCoachLanguages;
  final void Function(String language) addLanguage;
  final void Function(String language) removeLanguage;

  const ProfilePageLanguagesDropdownWidget({
    super.key,
    required this.addLanguage,
    required this.removeLanguage,
    required this.coachLanguages,
    required this.selectedCoachLanguages,
  });

  InputBorder get _enabledOutlineBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: GreyColor.g19));

  InputBorder get _errorOutlineBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: Colors.red));

  TextStyle get _helperTextStyle => AppTextStyle.medium(
    fontSize: 12.sp,
    color: GreyColor.g28,
  );

  TextStyle get _errorTextStyle => AppTextStyle.medium(
    fontSize: 12.sp,
    color: PinkColor.p15,
  );

  TextStyle get _hintTextStyle => AppTextStyle.medium(
    fontSize: 15.sp,
    color: GreyColor.g29,
  );

  TextStyle get _selectedLanguageTextStyle => AppTextStyle.normal(
    fontSize: 17.sp,
    color: Colors.black,
  );

  String get _helperText => 'Пожалуйста, добавьте какими языками владеете';

  String get _selectedLanguages {
    String languages = '';
    for (String l in selectedCoachLanguages) {
      languages += '$l, ';
    }
    //languages.length-1 to remove last comma
    return languages.substring(0, languages.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        (selectedCoachLanguages.isNotEmpty)
            ? _selectedLanguages
            : 'Выбрать',
        style: _selectedLanguageTextStyle

      ),
      borderRadius: BorderRadius.circular(8.r),
      icon: SignupPageAssetIconWidget(path: IconPath.buttonForward),
      validator: (values) {
        if (selectedCoachLanguages.isEmpty) {
          return _helperText;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          filled: true,
          errorMaxLines: 2,
          helperMaxLines: 2,
          helperText: _helperText,
          fillColor: Colors.white,
          hintStyle: _hintTextStyle,
          errorStyle: _errorTextStyle,
          helperStyle: _helperTextStyle,
          errorBorder: _errorOutlineBorder,
          focusedBorder: _enabledOutlineBorder,
          enabledBorder: _enabledOutlineBorder,
          focusedErrorBorder: _errorOutlineBorder,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r))),
      items: coachLanguages
          .map((e) => DropdownMenuItem(
        value: e,
        enabled: false,
        child: ProfilePageDropdownMenuItemContentWidget(
          selectedCoachLanguages: selectedCoachLanguages,
          removeLanguage: removeLanguage,
          addLanguage: addLanguage,
          element: e,
        ),
      ))
          .toList(),
      onChanged: (value) {},
    );
  }
}
