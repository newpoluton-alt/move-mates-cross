import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/choose_your_training_page.dart';

import '../wigets/settings_page/settings_page_app_bar.dart';
import '../wigets/settings_page/settings_page_button_widget.dart';
import '../wigets/settings_page/settings_page_joined_text_fields_widget.dart';
import '../wigets/settings_page/settings_page_rounded_check_boxes_widget.dart';
import '../wigets/settings_page/settings_page_subtitle_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const id = 'settings_page';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _firstCheckBoxBool;
  late bool _secondCheckBoxBool;
  late GlobalKey<FormState> _settingsPageTextFieldFormKey;

  @override
  void initState() {
    _firstCheckBoxBool = false;
    _secondCheckBoxBool = false;
    _settingsPageTextFieldFormKey = GlobalKey<FormState>();
    super.initState();
  }

  void _refreshData(int checkBoxId) {
    //first checkBox's id is equal to 0
    //second checkBox's id is equal to 1
    if (checkBoxId == 0) {
      _firstCheckBoxBool = !_firstCheckBoxBool;
    } else {
      _secondCheckBoxBool = !_secondCheckBoxBool;
    }
    setState(() {});
  }
void settingsPageSubmit() {

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor.g27,
      appBar: const SettingsPageAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _settingsPageTextFieldFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 80.r,
                      height: 80.r,
                      decoration: BoxDecoration(
                          color: GreyColor.g25,
                          borderRadius: BorderRadius.circular(80.r)),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Установить новое фото',
                        style: CoachTextStyle.common(
                            fontSize: 14.sp,
                            color: GreyColor.g26,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(height: 25.h),
                  const SettingsPageJoinedTextFields(),
                  const SettingsPageSubtitleWidget(
                    title: 'Введите ваше имя',
                  ),
                  SizedBox(height: 25.h),
                  const SettingsPageButton(
                    pageId: ChooseYourTrainingPage.id,
                    title: 'Рабочие часы',
                  ),
                  const SettingsPageSubtitleWidget(
                    title: 'Пожалуйста, добавьте рабочие часы',
                  ),
                  SizedBox(height: 25.h),
                  const SettingsPageButton(
                    pageId: ChooseYourTrainingPage.id,
                    title: 'Специализация',
                  ),
                  const SettingsPageSubtitleWidget(
                      title: 'Пожалуйста, добавьте специализацию'),
                  SizedBox(height: 25.h),
                  SettingsPageRoundedCheckBoxesWidget(
                    refreshData: _refreshData,
                    firstCheckBoxBool: _firstCheckBoxBool,
                    secondCheckBoxBool: _secondCheckBoxBool,
                  ),
                  const SettingsPageSubtitleWidget(title: 'Формат'),
                  const SettingsPageFormatEventTextFields()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsPageFormatEventTextFields extends StatelessWidget {
  const SettingsPageFormatEventTextFields({super.key});

  InputBorder get _offlineTextFieldsDecoration => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: GreyColor.g19));

  String? _formatEventTextFieldValidator() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              helperText: 'Название места',
              focusedBorder: _offlineTextFieldsDecoration,
              enabledBorder: _offlineTextFieldsDecoration),
          validator: (value) {
            if(value == null || value.isEmpty) {
              return 'Название места';
            }
            return null;
          },
        ),
        SizedBox(height: 8.h),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              helperMaxLines: 2,
              fillColor: Colors.white,
              focusedBorder: _offlineTextFieldsDecoration,
              enabledBorder: _offlineTextFieldsDecoration,
              helperText: 'Пожалуйста, добавьте адрес и название '
                  'места, где проходят оффлайн тренировки'),
          validator: (value) {
            if(value == null || value.isEmpty) {
              return 'Пожалуйста, добавьте адрес и название '
                  'места, где проходят оффлайн тренировки';
            }
            return null;
          },
        ),
        SizedBox(height: 8.h)
      ],
    );
  }
}
