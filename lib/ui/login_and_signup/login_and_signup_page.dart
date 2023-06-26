import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/login_and_signup/login/login_page.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/signup_page.dart';
import 'package:move_mates_android/ui/login_and_signup/validation_button_widget.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

class LoginAndSignUpPage extends StatefulWidget {
  static const id = 'login_and_signup_page';

  const LoginAndSignUpPage({super.key});

  @override
  State<LoginAndSignUpPage> createState() => _LoginAndSignUpPageState();
}

class _LoginAndSignUpPageState extends State<LoginAndSignUpPage> {
  void gotoPage(String id) {
    Navigator.of(context).pushNamed(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          ValidationButtonWidget(
            name: 'Вход',
            textStyle: AppButtonTextStyle.regularButtonBlack,
            onPushing: () {
              gotoPage(LoginPage.id);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          ValidationButtonWidget(
            name: 'Регистрация',
            textStyle: AppButtonTextStyle.regularButtonWhite,
            onPushing: () {
              gotoPage(SignupPage.id);
            },
            buttonColor: Colors.black,
          ),
        ]),
      ),
    );
  }
}
