import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/asset_icon_widget.dart';

import '../../theme/colors.dart';
import '../constants.dart';

class TabBarElementWidget extends StatelessWidget {
  final FocusNode emailNode;
  final FocusNode numberNode;
  final bool isPasswordVisible;
  final GlobalKey<FormState> textFieldFormKey;
  final void Function() changePasswordVisibility;
  final void Function(FocusNode focusNode) changeFocus;

  const TabBarElementWidget(
      {super.key,
      required this.emailNode,
      required this.numberNode,
      required this.isPasswordVisible,
      required this.textFieldFormKey,
      required this.changePasswordVisibility,
      required this.changeFocus});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFieldFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              labelText: 'Имя',
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Е-майл',
              hintText: 'Enter your email',
            ),
            focusNode: emailNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              changeFocus(numberNode);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          IntlPhoneField(

            focusNode: numberNode,
            textInputAction: TextInputAction.next,
            initialCountryCode: 'KG',
            decoration: const InputDecoration(hintText: '999 999 999'),
          ),
          TextFormField(
            obscureText: isPasswordVisible,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value){
              print(value.trim());
            },
            decoration: InputDecoration(
                labelText: 'Пароль',
                suffixIcon: IconButton(
                    onPressed: changePasswordVisibility,
                    icon: AssetIcon(
                        path: IconPath.eye,
                        color: !isPasswordVisible
                            ? ValidationColor.signInAndSignup
                            : ValidationColor.checkBoxGrey))),
          )
        ],
      ),
    );
  }
}
