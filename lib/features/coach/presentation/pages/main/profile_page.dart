import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_coach_profile_info_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/update_coach_profile_case.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_profile_state.dart';
import 'package:move_mates_android/features/coach/presentation/pages/main/specialisation_page.dart';
import 'package:move_mates_android/features/coach/presentation/pages/main/working_hours_page.dart';
import 'package:move_mates_android/features/injection_container.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_cubit.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth_page/auth_page_custom_snackbar_builder.dart';

import '../../../data/models/coach_profile_model.dart';
import '../../widgets/profile_page/profile_page_app_bar_widget.dart';
import '../../widgets/profile_page/profile_page_button_widget.dart';
import '../../widgets/profile_page/profile_page_common_text_field_widget.dart';
import '../../widgets/profile_page/profile_page_exit_button_widget.dart';
import '../../widgets/profile_page/profile_page_format_event_text_fields_widget.dart';
import '../../widgets/profile_page/profile_page_joined_text_fields_widget.dart';
import '../../widgets/profile_page/profile_page_languages_dropdown_widget.dart';
import '../../widgets/profile_page/profile_page_rounded_check_boxes_widget.dart';
import '../../widgets/profile_page/profile_page_subtitle_widget.dart';
import '../../widgets/profile_page/profile_page_switch_button_widget.dart';
import '../../widgets/profile_page/profile_page_values_handler.dart';
import 'qualification_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool _isOnline;
  late bool _isOffline;
  late bool _isFirstTrainingFree;
  late List<String> _coachLanguages;
  late ProfilePageNotifier _pageNotifier;
  late List<String> _selectedCoachLanguages;
  late ProfilePageValuesHandler _profilePageValuesHandler;
  late GlobalKey<FormState> _settingsPageTextFieldFormKey;

  @override
  void initState() {
    _isOnline = false;
    _isOffline = false;
    _selectedCoachLanguages = [];
    _isFirstTrainingFree = false;
    _pageNotifier = ProfilePageNotifier();
    _settingsPageTextFieldFormKey = GlobalKey<FormState>();
    _profilePageValuesHandler = ProfilePageValuesHandler();
    _coachLanguages = List.from(CoachPageConstants.coachLanguages);
    super.initState();
  }

  @override
  void dispose() {
    _profilePageValuesHandler.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if ((value ?? '').trim().isEmpty) {
      return 'Email';
    }
    if (!(EmailValidator.validate((value ?? '').trim()))) {
      return 'Пожалуйста, введите действительный Е-майл.';
    } else {
      return null;
    }
  }

  String? _phoneNumberValidator(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if ((value ?? '').trim().isEmpty) {
      return 'Номер';
    }
    if (!regExp.hasMatch((value ?? '').trim())) {
      return 'Пожалуйста, введите действительный номер.';
    } else {
      return null;
    }
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
      _isOnline = !_isOnline;
    } else {
      _isOffline = !_isOffline;
    }
    setState(() {});
  }

  void _refreshSwitchData() {
    setState(() {
      _isFirstTrainingFree = !_isFirstTrainingFree;
    });
  }

  bool _checkFieldsForBloc() {
    return _selectedCoachLanguages.isNotEmpty && (_isOffline || _isOnline);
  }

  void _settingsPageSubmit() {
    if (!mounted) return;
    if (!_settingsPageTextFieldFormKey.currentState!.validate()) return;
    if (!_checkFieldsForBloc()) return;
    final values = _profilePageValuesHandler;
    context.read<CoachProfileCubit>().onUpdatingCoachProfile(
          CoachProfileParam(
              aboutMe: values.goalEditingController.value.text.trim(),
              lastName: values.surnameEditingController.text.trim(),
              duration: int.tryParse(
                  values.countExperienceEditingController.text.trim()),
              birthDate: DateTime.now().toString().split(' ').first,
              firstName: values.nameEditingController.value.text.trim(),
              groupPrice: double.tryParse(
                  values.groupPriceEditingController.value.text.trim()),
              experience: null.toString(),
              phoneNumber: values.phoneEditingController.value.text.trim(),
              offlineName: values.offlineNameController.value.text.trim(),
              qualification: null.toString(),
              offlineLocation:
                  values.offlineLocationController.value.text.trim(),
              individualPrice: double.tryParse(
                  values.individualPriceEditingController.value.text.trim()),
              availableOffline: _isOffline,
              isFirstLessonFree: _isFirstTrainingFree,
              supportedLanguages: _selectedCoachLanguages),
        );

    _settingsPageTextFieldFormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserAuthCubit>(
          create: (_) => sl<UserAuthCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: GreyColor.g8,
        appBar: ProfilePageAppBarWidget(
            settingsPageSubmit: _settingsPageSubmit),
        body: BlocBuilder<CoachProfileCubit, CoachProfileState>(
            builder: (context, state) {
          if (state is CoachProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CoachProfileError) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildAuthPageCustomSnackBar(state.error));
            });
          }
          if (state is CoachProfileLoaded) {
            _pageNotifier
                .initializeProfileModel((state.model as CoachProfileModel));
          }

          return ValueListenableBuilder<CoachProfileModel?>(
            valueListenable: _pageNotifier.profileNotifier,
            builder: (context, value, _) {
              if (value != null && _profilePageValuesHandler.model == null) {
                _profilePageValuesHandler.model = value;
                _profilePageValuesHandler.initControllersValues();
              }

              return GestureDetector(
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
                          ProfilePageJoinedTextFields(
                            nameEditingController: _profilePageValuesHandler
                                .nameEditingController,
                            lastnameEditingController:
                                _profilePageValuesHandler
                                    .surnameEditingController,
                          ),
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
                            isOnline: _isOnline,
                            isOffline: _isOffline,
                          ),
                          ProfilePageSubtitleWidget(
                              title: _isOffline || _isOnline
                                  ? 'Формат'
                                  : 'Пожалуйста, добавьте формат'),
                          (_isOffline)
                              ? Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  child: ProfilePageFormatEventTextFields(
                                    offlineNameController:
                                        _profilePageValuesHandler
                                            .offlineNameController,
                                    offlineLocationController:
                                        _profilePageValuesHandler
                                            .offlineLocationController,
                                  ))
                              : const SizedBox(),
                          SizedBox(height: 25.h),
                          ProfilePageSwitchButton(
                            refreshSwitchData: _refreshSwitchData,
                            isFirstTrainingFree: _isFirstTrainingFree,
                          ),
                          SizedBox(height: 25.h),
                          ProfilePageCommonTextField(
                            textFieldHintText: 'Опыт',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textFieldHelperText:
                                'Пожалуйста, добавьте количество лет опыта',
                            textEditingController: _profilePageValuesHandler
                                .countExperienceEditingController,
                          ),
                          SizedBox(height: 25.h),
                          ProfilePageCommonTextField(
                            textFieldHintText: 'Цена',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textFieldHelperText:
                                'Установите цену за час в USD (индив)',
                            textEditingController: _profilePageValuesHandler
                                .individualPriceEditingController,
                          ),
                          SizedBox(height: 25.h),
                          ProfilePageCommonTextField(
                            textFieldHintText: 'Цена',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textFieldHelperText:
                                'Установите цену за час  в USD (группа)',
                            textEditingController: _profilePageValuesHandler
                                .groupPriceEditingController,
                          ),
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
                              textEditingController: _profilePageValuesHandler
                                  .goalEditingController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              textFieldHelperText:
                                  'Пожалуйста, добавьте цели, с '
                                  'которыми вы можете помочь своим клиентам'),
                          SizedBox(height: 25.h),
                          const ProfilePageButtonWidget(
                            title: 'Квалификация',
                            pageId: QualificationPage.id,
                          ),
                          const ProfilePageSubtitleWidget(
                              title:
                                  'Пожалуйста, добавьте детали квалификации '
                                  '(название, описание, сертификаты)'),
                          SizedBox(height: 25.h),
                          ProfilePageCommonTextField(
                            textFieldHintText: 'Номер',
                            textFieldHelperText: 'Номер',
                            validator: _phoneNumberValidator,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            textEditingController: _profilePageValuesHandler
                                .phoneEditingController,
                          ),
                          SizedBox(height: 25.h),
                          ProfilePageCommonTextField(
                            validator: _emailValidator,
                            textFieldHintText: 'Email',
                            textFieldHelperText: 'Email',
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            textEditingController: _profilePageValuesHandler
                                .emailEditingController,
                          ),
                          SizedBox(height: 50.h),
                          const ProfilePageExitButtonWidget(),
                          SizedBox(height: 50.h)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class ProfilePageNotifier {
  final ValueNotifier<CoachProfileModel?> profileNotifier = ValueNotifier(null);

  void initializeProfileModel(CoachProfileModel model) {
    profileNotifier.value = model;
  }
}
