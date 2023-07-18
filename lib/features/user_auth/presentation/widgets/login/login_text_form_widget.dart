import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/routes/assets_routes.dart';
import '../signup/asset_icon_widget.dart';

class LoginTextFormWidget extends StatelessWidget {
  final GlobalKey<FormState> signupFormKey;
  final bool isPasswordVisible;
  final void Function() changePasswordVisibility;
  final TextEditingController emailEditingController;
  final TextEditingController passEditingController;

  const LoginTextFormWidget(
      {super.key,
      required this.signupFormKey,
      required this.isPasswordVisible,
      required this.changePasswordVisibility,
      required this.emailEditingController,
      required this.passEditingController});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signupFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailEditingController,
              decoration: const InputDecoration(
                labelText: 'Е-майл',
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите ваш адрес электронной почты.';
                } else if (!EmailValidator.validate(value)) {
                  return 'Пожалуйста, введите действительный Е-майл.';
                }
                return null;
              },
            ),
            SizedBox(
              height: 21.h,
            ),
            TextFormField(
              controller: passEditingController,
              obscureText: !isPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: 'Пароль',
                  hintText: '• • • • • • • •',
                  suffixIcon: IconButton(
                      onPressed: changePasswordVisibility,
                      icon: AssetIcon(
                          path: IconPath.eye,
                          color: isPasswordVisible
                              ? ValidationColor.signInAndSignup
                              : ValidationColor.checkBoxGrey))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите пароль.';
                } else if (value.isNotEmpty && value.length < 8) {
                  return 'Пароль должен содержать не менее 8 символов.';
                }
                return null;
              },
            )
          ],
        ));
  }
}
