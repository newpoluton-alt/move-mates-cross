import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/auth/back_button_widget.dart';
import 'package:move_mates_android/ui/auth/login/login_text_form_widget.dart';
import 'package:move_mates_android/ui/auth/signup/signup_page.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

import '../../../bloc/auth_bloc.dart';
import '../../../bloc/auth_bloc_state.dart';
import '../../theme/colors.dart';
import '../../theme/constants.dart';
import '../validation_button_widget.dart';
import 'move_to_registration_page_text_widget.dart';
import 'signed_divider_widget.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _nameEditingController;
  late final TextEditingController _passEditingController;
  bool _isPasswordVisible = false;
  final _signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _passEditingController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButtonWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {

            isStateChanged(state);

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aвторизация',
                  style: ValidationPageTextStyle.loginSemiBold,
                ),
                Text(
                  'Заполните форму входа чтобы, начать работу с приложением',
                  style: ValidationPageTextStyle.regular,
                ),
                SizedBox(
                  height: 36.h,
                ),
                LoginTextFormWidget(
                    signupFormKey: _signupFormKey,
                    isPasswordVisible: _isPasswordVisible,
                    nameEditingController: _nameEditingController,
                    passEditingController: _passEditingController,
                    changePasswordVisibility: changePasswordVisibility),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Забыли пароль?',
                          style: ValidationPageTextStyle.checkBoxMediumGrey,
                        ))),
                SizedBox(
                  height: 130.h,
                ),
                ValidationButtonWidget(
                  name: state is AuthStateLoading?'Загрузка...': 'Войти',
                  textStyle: AppButtonTextStyle.regularButtonWhite,
                  buttonColor: Colors.black,
                  onPushing: () {
                    _submit();
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
            );
          }),
        ),
      ),
    );
  }
  void changePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
  void isStateChanged(AuthState state) {
    if(state is AuthStateLoaded) {
      Navigator.of(context).pushReplacementNamed(SignupPage.id);
    }
    if(state is AuthStateError){
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: ));
    }
  }
  void isStateError(AuthState state) {

  }
  void _submit() {
    if (!mounted) {
      return;
    }
    final isValid = _signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _signupFormKey.currentState!.save();
    context.read<AuthCubit>().loginUser(
        name: _nameEditingController.text,
        password: _passEditingController.text);
  }

}
