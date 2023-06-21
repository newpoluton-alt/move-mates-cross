import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

class LoginAndSignUpPage extends StatefulWidget {
  static const id = 'login_and_signup_page';

  const LoginAndSignUpPage({super.key});

  @override
  State<LoginAndSignUpPage> createState() => _LoginAndSignUpPageState();
}

class _LoginAndSignUpPageState extends State<LoginAndSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          MaterialButton(
            minWidth: 370.w,
            height: 60.h,
            shape: RoundedRectangleBorder(side: BorderSide(),
                borderRadius: BorderRadius.circular(10.r)),
            onPressed: () {},
            child: Text('Вход', style: AppButtonTextStyle.regularButtonBlack),
          ),
          SizedBox(height: 15.h,),
          MaterialButton(
            minWidth: 370.w,
            height: 60.h,
            color: Colors.black,
            shape: RoundedRectangleBorder(side: const BorderSide(),
                borderRadius: BorderRadius.circular(10.r)),
            onPressed: () {},
            child: Text('Регистрация', style: AppButtonTextStyle.regularButtonWhite),
          ),
        ]),
      ),
    );
  }
}
