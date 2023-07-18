import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/back_button_widget.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/validation_button_widget.dart';
import 'package:move_mates_android/config/theme/text_style.dart';

class ForgottenPasswordPage extends StatefulWidget {
  static const String id = 'forgotten_password_page';
  const ForgottenPasswordPage({super.key});

  @override
  State<ForgottenPasswordPage> createState() => _ForgottenPasswordPageState();
}

class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
  late final GlobalKey<FormState> _textFormFieldKey;
  late final TextEditingController _emailEditingController;

  @override
  void initState() {
    _textFormFieldKey = GlobalKey<FormState>();
    _emailEditingController = TextEditingController();
    super.initState();
  }
void _submit(){
    if(!mounted) return;
    final isValid = _textFormFieldKey.currentState!.validate();
    if(!isValid) return;

    _textFormFieldKey.currentState!.save();

}
  @override
  Widget build(BuildContext context) {
    print(1.sh - buildAppBar().preferredSize.height);
    return SizedBox(
      height: 1.sh,
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh - (0.11.sh),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 31.h, horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height:30.h,),
                  Text(
                    'Забыли пароль?',
                    style: ForgottenPasswordPageTextStyle.titleSemiBold,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Пожалуйста, введите свой адрес электронной почты'
                    ' и мы вышлeм вам инструкции по сбросу пароля.',
                    textAlign: TextAlign.center,
                    style: ForgottenPasswordPageTextStyle.descriptionRegular,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Form(
                    key: _textFormFieldKey,
                    child: TextFormField(
                      controller: _emailEditingController,
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
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ValidationButtonWidget(
                    name: 'Отправить инструкцию',
                    textStyle: AppButtonTextStyle.regularButtonWhite,
                    buttonColor: Colors.black,
                    onPushing: _submit,

                  ),
                  const Expanded(
                      child: SizedBox()),
                  Text(
                    'По любым '
                    'вопросам обращайтесь по номеру +996 123 456 789',
                    textAlign: TextAlign.center,
                    style: ForgottenPasswordPageTextStyle.descriptionMediumGrey,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: const Text('Восстановление пароля'),
        leading: const BackButtonWidget(),
      );
  }
}
