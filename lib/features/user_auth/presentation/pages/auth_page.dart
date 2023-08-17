import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/login_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/signup_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/validation_button_widget.dart';

import '../../../../config/theme/colors/pink_color.dart';
import '../../../../config/theme/text_styles/user_auth/app_text_style.dart';

class AuthPage extends StatefulWidget {
  static const id = 'login_and_signup_page';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void gotoPage(String id) {
    Navigator.of(context).pushNamed(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImagePath.imgFifth,
                  height: 0.7.sh,
                  width: 1.sw,
                  fit: BoxFit.fitWidth,
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding:
                      EdgeInsets.only(right: 20.w, left: 20.w, bottom: 50.h),
                  child: Column(
                    children: [
                      ValidationButtonWidget(
                        name: 'Вход',
                        buttonBorderColor:
                            PinkColor.p4,
                        textStyle: AppButtonTextStyle.regularButtonPink,
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
                        buttonColor: PinkColor.p4,
                        buttonBorderColor: PinkColor.p4,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
