import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import '../constants.dart';
import '../signup/asset_icon_widget.dart';

class LoginTextFormWidget extends StatelessWidget {
  final GlobalKey<FormState> signupFormKey;
  final bool isPasswordVisible;
  final void Function() changePasswordVisibility;

  const LoginTextFormWidget(
      {super.key,
      required this.signupFormKey,
      required this.isPasswordVisible,
      required this.changePasswordVisibility});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signupFormKey,
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Имя',
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 21.h,
            ),
            TextField(
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
            )
          ],
        ));
  }
}
