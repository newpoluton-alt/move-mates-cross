import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/bloc/auth_bloc/auth_bloc.dart';
import 'package:move_mates_android/bloc/auth_bloc/auth_bloc_state.dart';
import 'package:move_mates_android/bloc/tools/auth_bloc_tools.dart';
import 'package:move_mates_android/ui/auth/signup/signup_checkbox_widget.dart';
import 'package:move_mates_android/ui/auth/signup/tab_view_widget.dart';
import 'package:move_mates_android/ui/auth/validation_button_widget.dart';
import 'package:move_mates_android/ui/theme/text_style.dart';

import '../../../bloc/models/signup_request_model.dart';
import '../back_button_widget.dart';

class SignupPage extends StatefulWidget {
  static const id = 'signup_page';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isCoach = false;
  bool? _doUserAgree;
  late final GlobalKey<FormState> _textFieldFormKey;
  late final TextEditingController _nameEditingController;
  late final TextEditingController _emailEditingController;
  late final TextEditingController _numberEditingController;
  late final TextEditingController _passEditingController;

  void changeMind(bool? agreement) {
    if (agreement != null) {
      setState(() {
        _doUserAgree = agreement;
      });
    }
  }

  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _numberEditingController = TextEditingController();
    _passEditingController = TextEditingController();
    _textFieldFormKey = GlobalKey<FormState>();
    super.initState();
  }

  void changeStatus(int index) {
    setState(() {
      _isCoach = (index == 1);
    });
  }

  void _submit(BuildContext context) {
    if (!mounted) {
      return;
    }

    final isValid = _textFieldFormKey.currentState!.validate();
    if(!(_doUserAgree ?? false)) {
      setState(() {
        _doUserAgree = false;
      });
      return;
    }

    if (!isValid) {
      return;
    }

    _textFieldFormKey.currentState!.save();
    context.read<AuthCubit>().createUser(SignupRequestModel(
          name: _nameEditingController.text.trim(),
          email: _emailEditingController.text.trim(),
          password: _passEditingController.text.trim(),
          phone: _numberEditingController.text.trim(),
          role: (_isCoach) ? UserRole.coach : UserRole.regularUser,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          //if a state is changed to loaded, this function automatically will
          //navigate to user page saving credential data
          AuthBlocTools.isStateChanged(
              id: SignupPage.id, state: state, context: context);
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
                    changeStatus: changeStatus,
                    textFieldFormKey: _textFieldFormKey,
                    nameEditingController: _nameEditingController,
                    emailEditingController: _emailEditingController,
                    numberEditingController: _numberEditingController,
                    passEditingController: _passEditingController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SignupCheckboxWidget(
                    doUserAgree: _doUserAgree,
                    changeMind: changeMind,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ValidationButtonWidget(
                    name: state is AuthStateLoading
                        ? 'Загрузка...'
                        : 'Зарегистрироваться',
                    textStyle: AppButtonTextStyle.regularButtonWhite,
                    buttonColor: Colors.black,
                    onPushing: () {
                      _submit(context);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
            ),
          );
        });
      }),
    );
  }
}
