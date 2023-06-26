import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/login_and_signup/constants.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/asset_icon_widget.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/signup_checkbox_widget.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/tab_view_widget.dart';
import 'package:move_mates_android/ui/login_and_signup/validation_button_widget.dart';
import 'package:move_mates_android/ui/theme/colors.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

import '../back_button_widget.dart';

class SignupPage extends StatefulWidget {
  static const id = 'signup_page';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _doUserAgree = false;
  late final GlobalKey<FormState> _textFieldFormKey;
  late final GlobalKey<FormState> _textFieldFormKeySecond;

  void changeMind() {
    setState(() {
      _doUserAgree = !_doUserAgree;
    });
  }

  @override
  void initState() {
    _textFieldFormKey = GlobalKey<FormState>();
    _textFieldFormKeySecond = GlobalKey<FormState>();

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
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Создать учетную запись',
              style: ValidationPageTextStyle.medium,
            ),
            Text(
              'Создайте учетную запись, чтобы начать работу с приложением',
              style: ValidationPageTextStyle.regular,
            ),
            SizedBox(
              height: 15.h,
            ),
            TabViewWidget(
                textFieldFormKey: _textFieldFormKey,
                textFieldFormKeySecond: _textFieldFormKeySecond),
            SizedBox(
              height: 30.h,
            ),
            SignupCheckboxWidget(
                doUserAgree: _doUserAgree, changeMind: changeMind),
            SizedBox(
              height: 30.h,
            ),
            ValidationButtonWidget(
              name: 'Зарегистрироваться',
              textStyle: AppButtonTextStyle.regularButtonWhite,
              buttonColor: Colors.black,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        )),
      ),
    );
  }
}

