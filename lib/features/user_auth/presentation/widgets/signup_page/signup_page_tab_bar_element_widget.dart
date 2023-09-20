import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/green_color.dart';
import 'signup_page_asset_icon_widget.dart';

class SignupPageTabBarElementWidget extends StatelessWidget {
  final FocusNode emailNode;
  final FocusNode numberNode;
  final bool isPasswordVisible;
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final TextEditingController numberEditingController;
  final TextEditingController passEditingController;
  final GlobalKey<FormState> textFieldFormKey;
  final void Function() changePasswordVisibility;
  final void Function(String num) completeNumber;
  final void Function(FocusNode focusNode) changeFocus;

  const SignupPageTabBarElementWidget(
      {super.key,
      required this.emailNode,
      required this.numberNode,
      required this.isPasswordVisible,
      required this.textFieldFormKey,
      required this.changePasswordVisibility,
      required this.changeFocus,
      required this.nameEditingController,
      required this.emailEditingController,
      required this.numberEditingController,
      required this.passEditingController, required this.completeNumber});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFieldFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameEditingController,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              labelText: 'Имя',
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if ((value?? '').trim().isEmpty) {
                return 'Пожалуйста, введите ваше имя.';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            controller: emailEditingController,
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
            validator: (value) {
              if (value == null || (value).trim().isEmpty) {
                return 'Пожалуйста, введите ваш адрес электронной почты.';
              } else if (!EmailValidator.validate(value)) {
                return 'Пожалуйста, введите действительный Е-майл.';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          IntlPhoneField(
            onSaved: (phone) {
              completeNumber(phone!.completeNumber);
            },
            focusNode: numberNode,
            controller: numberEditingController,
            textInputAction: TextInputAction.next,
            initialCountryCode: 'KG',
            decoration: const InputDecoration(hintText: '999 999 999'),
            invalidNumberMessage: 'Пожалуйста, введите ваш номер телефона.',
            pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white),
          ),
          TextFormField(
            controller: passEditingController,
            obscureText: !isPasswordVisible,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                labelText: 'Пароль',
                hintText: '• • • • • • • •',
                suffixIcon: IconButton(
                    onPressed: changePasswordVisibility,
                    icon: SignupPageAssetIconWidget(
                        path: IconPath.eye,
                        color: isPasswordVisible
                            ? GreenColor.g1
                            : GreyColor.g2))),
            validator: (value) {
              if (value == null || (value).trim().isEmpty) {
                return 'Пожалуйста, введите пароль.';
              } else if (value.isNotEmpty && value.length < 8) {
                return 'Пароль должен содержать не менее 8 символов.';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
