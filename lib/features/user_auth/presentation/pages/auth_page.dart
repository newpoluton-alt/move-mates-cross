import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/routes/assets_routes.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/login_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/signup_page.dart';

import '../../../../config/theme/colors/pink_color.dart';
import '../../../../config/theme/text_styles/user_auth/main_text_style.dart';
import '../widgets/auth_page/auth_page_validation_button_widget.dart';

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
                SizedBox(
                  child: Image.asset(
                    ImagePath.imgFifth,
                    width: 1.sw,
                    height: 0.70.sh,
                    fit: BoxFit.cover,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding:
                      EdgeInsets.only(right: 20.w, left: 20.w, bottom: 50.h),
                  child: Column(
                    children: [
                      AuthPageValidationButtonWidget(
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
                      AuthPageValidationButtonWidget(
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
