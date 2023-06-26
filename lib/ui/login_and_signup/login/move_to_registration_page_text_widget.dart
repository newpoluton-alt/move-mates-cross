

import 'package:flutter/material.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/signup_page.dart';

import '../../theme/text_style.dart';

class RegistrationTextMoveWidget extends StatelessWidget {
  const RegistrationTextMoveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Нет аккаунта?',
          style: ValidationPageTextStyle.signupRegular,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(SignupPage.id);
            },
            child: Text(
              'Зарегистрируйтесь',
              style: ValidationPageTextStyle.signupSemiBold,
            ))
      ],
    );
  }
}
