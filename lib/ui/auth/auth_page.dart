import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/bloc/bloc.dart';
import 'package:move_mates_android/ui/auth/login/login_page.dart';
import 'package:move_mates_android/ui/auth/signup/signup_page.dart';
import 'package:move_mates_android/ui/auth/validation_button_widget.dart';
import 'package:move_mates_android/ui/theme/constants.dart';
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
    Authorisation()
        .createUser(
            name: UniqueKey().toString().substring(0, 7),
            email: UniqueKey().toString().substring(0, 7),
            password: UniqueKey().toString().substring(0, 7),
            phone: UniqueKey().toString().substring(0, 7),)
        .then((value) => debugPrint(value.toJson(value).toString()));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image.asset(
          ImagePath.imgFifth,
          width: 1.sw,
          height: 620.h,
          fit: BoxFit.fitWidth,
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 50.h),
          child: Column(
            children: [
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
            ],
          ),
        ),
      ]),
    );
  }
}
