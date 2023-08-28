import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/qualification_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/specialisation_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/working_hours_page.dart';
import 'package:move_mates_android/features/injection_container.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_cubit.dart';

import '../../wigets/profile_page/profile_page_app_bar_widget.dart';
import '../../wigets/profile_page/profile_page_button_widget.dart';
import '../../wigets/profile_page/profile_page_common_text_field_widget.dart';
import '../../wigets/profile_page/profile_page_exit_button_widget.dart';
import '../../wigets/profile_page/profile_page_format_event_text_fields_widget.dart';
import '../../wigets/profile_page/profile_page_joined_text_fields_widget.dart';
import '../../wigets/profile_page/profile_page_languages_dropdown_widget.dart';
import '../../wigets/profile_page/profile_page_rounded_check_boxes_widget.dart';
import '../../wigets/profile_page/profile_page_subtitle_widget.dart';
import '../../wigets/profile_page/profile_page_switch_button_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool _firstCheckBoxBool;
  late bool _secondCheckBoxBool;
  late List<String> _coachLanguages;
  late bool _settingsPageSwitchBoolValue;
  late List<String> _selectedCoachLanguages;
  late GlobalKey<FormState> _settingsPageTextFieldFormKey;

  @override
  void initState() {
    _firstCheckBoxBool = false;
    _secondCheckBoxBool = false;
    _selectedCoachLanguages = [];
    _settingsPageSwitchBoolValue = false;
    _settingsPageTextFieldFormKey = GlobalKey<FormState>();
    _coachLanguages = List.from(CoachPageConstants.coachLanguages);
    super.initState();
  }

  void _addLanguages(String language) {
    setState(() {
      _selectedCoachLanguages.add(language);
    });
  }

  void _removeLanguage(String language) {
    setState(() {
      _selectedCoachLanguages.remove(language);
    });
  }

  void _refreshEventCheckBoxData(int checkBoxId) {
    //first checkBox's id is equal to 0
    //second checkBox's id is equal to 1
    if (checkBoxId == 0) {
      _firstCheckBoxBool = !_firstCheckBoxBool;
    } else {
      _secondCheckBoxBool = !_secondCheckBoxBool;
    }
    setState(() {});
  }

  void _refreshSwitchData() {
    setState(() {
      _settingsPageSwitchBoolValue = !_settingsPageSwitchBoolValue;
    });
  }

  void _settingsPageSubmit() {
    if (!mounted) return;
    if (!_settingsPageTextFieldFormKey.currentState!.validate()) return;
    _settingsPageTextFieldFormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAuthCubit>(
        create: (_) => sl<UserAuthCubit>(),
        child: Scaffold(
          backgroundColor: GreyColor.g8,
          appBar: ProfilePageAppBarWidget(settingsPageSubmit: _settingsPageSubmit),
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
                            style: AppTextStyle.medium(
                              fontSize: 14.sp,
                              color: GreyColor.g26,
                            ),
                          )),
                      SizedBox(height: 25.h),
                      const ProfilePageJoinedTextFields(),
                      const ProfilePageSubtitleWidget(
                        title: 'Введите ваше имя',
                      ),
                      SizedBox(height: 25.h),
                      const ProfilePageButtonWidget(
                        pageId: WorkingHoursPage.id,
                        title: 'Рабочие часы',
                      ),
                      const ProfilePageSubtitleWidget(
                        title: 'Пожалуйста, добавьте рабочие часы',
                      ),
                      SizedBox(height: 25.h),
                      const ProfilePageButtonWidget(
                        pageId: SpecialisationPage.id,
                        title: 'Специализация',
                      ),
                      const ProfilePageSubtitleWidget(
                          title: 'Пожалуйста, добавьте специализацию'),
                      SizedBox(height: 25.h),
                      ProfilePageRoundedCheckBoxesWidget(
                        refreshData: _refreshEventCheckBoxData,
                        firstCheckBoxBool: _firstCheckBoxBool,
                        secondCheckBoxBool: _secondCheckBoxBool,
                      ),
                      ProfilePageSubtitleWidget(
                          title: _secondCheckBoxBool
                              ? 'Формат'
                              : 'Пожалуйста, добавьте формат'),
                      (_secondCheckBoxBool)
                          ? Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: const ProfilePageFormatEventTextFields())
                          : const SizedBox(),
                      SizedBox(height: 25.h),
                      ProfilePageSwitchButton(
                        refreshSwitchData: _refreshSwitchData,
                        settingsPageSwitchBoolValue:
                            _settingsPageSwitchBoolValue,
                      ),
                      SizedBox(height: 25.h),
                      ProfilePageCommonTextField(
                          textFieldHintText: 'Опыт',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textFieldHelperText:
                              'Пожалуйста, добавьте количество лет опыта'),
                      SizedBox(height: 25.h),
                      ProfilePageCommonTextField(
                          textFieldHintText: 'Цена',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textFieldHelperText:
                              'Установите цену за час в USD (индив)'),
                      SizedBox(height: 25.h),
                      ProfilePageCommonTextField(
                          textFieldHintText: 'Цена',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textFieldHelperText:
                              'Установите цену за час  в USD (группа)'),
                      SizedBox(height: 25.h),
                      ProfilePageLanguagesDropdownWidget(
                        addLanguage: _addLanguages,
                        coachLanguages: _coachLanguages,
                        removeLanguage: _removeLanguage,
                        selectedCoachLanguages: _selectedCoachLanguages,
                      ),
                      SizedBox(height: 25.h),
                      ProfilePageCommonTextField(
                          maxLines: null,
                          textFieldHintText: 'Цель',
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          textFieldHelperText: 'Пожалуйста, добавьте цели, с '
                              'которыми вы можете помочь своим клиентам'),
                      SizedBox(height: 25.h),
                      const ProfilePageButtonWidget(
                        title: 'Квалификация',
                        pageId: QualificationPage.id,
                      ),
                      const ProfilePageSubtitleWidget(
                          title: 'Пожалуйста, добавьте детали квалификации '
                              '(название, описание, сертификаты)'),
                      SizedBox(height: 25.h),
                      ProfilePageCommonTextField(
                        textFieldHintText: 'Номер',
                        textFieldHelperText: 'Номер',
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        textEditingController:
                            TextEditingController(text: '+996 999 999 999'),
                      ),
                      SizedBox(height: 25.h),
                      ProfilePageCommonTextField(
                        textFieldHintText: 'Email',
                        textFieldHelperText: 'Email',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        textEditingController:
                            TextEditingController(text: 'coach@gmail.com'),
                      ),
                      SizedBox(height: 50.h),
                      const ProfilePageExitButtonWidget(),
                      SizedBox(height: 50.h)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

