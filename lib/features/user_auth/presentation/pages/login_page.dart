import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_cubit.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/forgotten_password_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/back_button_widget.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/login/login_text_form_widget.dart';

import '../../../../config/routes/assets_routes.dart';
import '../../../../config/theme/colors.dart';
import '../../../../config/theme/text_styles/user_auth/app_text_style.dart';
import '../../../../config/theme/text_styles/user_auth/auth_text_style.dart';
import '../../user_auth_injection_container.dart';
import '../../../coach/presentation/pages/coach_main_page.dart';
import '../../domain/usecases/user_sign_in.dart';
import '../cubit/user_auth_state.dart';
import '../widgets/auth/custom_snackbar_builder.dart';
import '../widgets/auth/validation_button_widget.dart';
import '../widgets/login/move_to_registration_page_text_widget.dart';
import '../widgets/login/signed_divider_widget.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailEditingController;
  late final TextEditingController _passEditingController;
  bool _isPasswordVisible = false;
  final _signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailEditingController = TextEditingController();
    _passEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAuthCubit>(
      create: (_) => sl<UserAuthCubit>(),
      child: Builder(builder: (context) {
        return BlocBuilder<UserAuthCubit, UserAuthState>(
            builder: (context, state) {
          //if a state is changed to loaded, this function automatically will
          //navigate to user page saving credential data
          if (state is UserAuthLoaded) {
            Future.delayed(Duration.zero, () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  UserPage.id, (Route<dynamic> route) => false);
            });
          }
          if (state is UserAuthError) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aвторизация',
                      style: ValidationTextStyle.loginSemiBold,
                    ),
                    Text(
                      'Заполните форму входа чтобы, начать работу с приложением',
                      style: ValidationTextStyle.regular,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    LoginTextFormWidget(
                        signupFormKey: _signupFormKey,
                        isPasswordVisible: _isPasswordVisible,
                        emailEditingController: _emailEditingController,
                        passEditingController: _passEditingController,
                        changePasswordVisibility: changePasswordVisibility),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(ForgottenPasswordPage.id);
                            },
                            child: Text(
                              'Забыли пароль?',
                              style: ValidationTextStyle.checkBoxMediumGrey,
                            ))),
                    SizedBox(
                      height: 130.h,
                    ),
                    ValidationButtonWidget(
                      name: state is UserAuthLoading ? 'Загрузка...' : 'Войти',
                      textStyle: AppButtonTextStyle.regularButtonWhite,
                      buttonColor: Colors.black,
                      onPushing: () {
                        _submit(context);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const SignedDividerWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    ValidationButtonWidget(
                      name: 'Google',
                      textStyle: AppButtonTextStyle.regularButtonBlackMedium,
                      iconPath: IconPath.google,
                      buttonBorderColor: ValidationColor.textFieldColor,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const RegistrationTextMoveWidget()
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }

  void changePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _submit(BuildContext context) async {
    if (!mounted) {
      return;
    }
    final isValid = _signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _signupFormKey.currentState!.save();
    FocusScope.of(context).unfocus();
    context.read<UserAuthCubit>().onUserSignIn(SignInParam(
        email: _emailEditingController.text.trim(),
        password: _passEditingController.text.trim()));
  }
}
