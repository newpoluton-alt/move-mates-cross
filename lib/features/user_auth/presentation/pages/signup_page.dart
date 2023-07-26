import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/core/enum/user_role_enum.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_up.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_cubit.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/validation_button_widget.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/signup_checkbox_widget.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/tab_view_widget.dart';

import '../../../../config/theme/text_styles/user_auth/app_text_style.dart';
import '../../../../config/theme/text_styles/user_auth/auth_text_style.dart';
import '../../../../user_auth_injection_container.dart';
import '../cubit/user_auth_state.dart';
import '../widgets/auth/back_button_widget.dart';
import '../widgets/auth/custom_snackbar_builder.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  static const id = 'signup_page';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isCoach = false;
  bool? _doUserAgree;
  late final GlobalKey<FormState> _textFieldFormKey;
  late final TextEditingController _nameEditingController;
  late final TextEditingController _emailEditingController;
  late final TextEditingController _numberEditingController;
  late final TextEditingController _passEditingController;
  String _phoneNumber = '';

  void changeMind(bool? agreement) {
    if (agreement != null) {
      setState(() {
        _doUserAgree = agreement;
      });
    }
  }

  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _numberEditingController = TextEditingController();
    _passEditingController = TextEditingController();
    _textFieldFormKey = GlobalKey<FormState>();
    super.initState();
  }

  void _completeNumber(String num) {
    setState(() {
      _phoneNumber = num;
    });
  }
  void changeStatus(int index) {
    setState(() {
      _isCoach = (index == 1);
    });
  }

  void _submit(BuildContext context) {
    if (!mounted) {
      return;
    }

    final isValid = _textFieldFormKey.currentState!.validate();
    if (!(_doUserAgree ?? false)) {
      setState(() {
        _doUserAgree = false;
      });
      return;
    }

    if (!isValid) {
      return;
    }

    _textFieldFormKey.currentState!.save();
    FocusScope.of(context).unfocus();
    context.read<UserAuthCubit>().onUserSignUp(SignUpParam(
          name: _nameEditingController.text.trim(),
          email: _emailEditingController.text.trim(),
          password: _passEditingController.text.trim(),
          phone: _phoneNumber.trim(),
          role: (_isCoach) ? UserRoleEnum.coach : UserRoleEnum.client,
          birthDate: DateTime.now().toString().substring(0, 10),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserAuthCubit>(),
      child: Builder(builder: (context) {
        return BlocBuilder<UserAuthCubit, UserAuthState>(
            builder: (context, state) {
          //if a state is changed to loaded, this function automatically will
          //navigate to user page saving credential data
              if (state is Loaded) {
                Future.delayed(Duration.zero, () {
                    Navigator.of(context).pushReplacementNamed(LoginPage.id);
                });
              }
              if (state is Error) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(buildCustomAuthSnackBar(state.error));
                });
              }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: const BackButtonWidget(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Создать учетную запись',
                    style: ValidationTextStyle.medium,
                  ),
                  Text(
                    'Создайте учетную запись, чтобы начать работу с приложением',
                    style: ValidationTextStyle.regular,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TabViewWidget(
                    changeStatus: changeStatus,
                    textFieldFormKey: _textFieldFormKey,
                    nameEditingController: _nameEditingController,
                    emailEditingController: _emailEditingController,
                    numberEditingController: _numberEditingController,
                    passEditingController: _passEditingController,
                    completeNumber: _completeNumber,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SignupCheckboxWidget(
                    doUserAgree: _doUserAgree,
                    changeMind: changeMind,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ValidationButtonWidget(
                    name: state is Loading
                        ? 'Загрузка...'
                        : 'Зарегистрироваться',
                    textStyle: AppButtonTextStyle.regularButtonWhite,
                    buttonColor: Colors.black,
                    onPushing: () {
                      _submit(context);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
            ),
          );
        });
      }),
    );
  }
}
