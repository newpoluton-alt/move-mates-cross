import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/pink_color.dart';
import 'signup_page_specialist_tab_bar_widget.dart';
import 'signup_page_tab_bar_element_widget.dart';
import 'signup_page_tab_bar_widget.dart';

class SignupPageTabViewWidget extends StatefulWidget {
  final void Function(int i) changeStatus;
  final GlobalKey<FormState> textFieldFormKey;
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final TextEditingController numberEditingController;
  final TextEditingController passEditingController;
  final void Function(String num) completeNumber;

  const SignupPageTabViewWidget({
    super.key,
    required this.changeStatus,
    required this.textFieldFormKey,
    required this.nameEditingController,
    required this.emailEditingController,
    required this.numberEditingController,
    required this.passEditingController,
    required this.completeNumber,
  });

  @override
  State<SignupPageTabViewWidget> createState() => _SignupPageTabViewWidgetState();
}

class _SignupPageTabViewWidgetState extends State<SignupPageTabViewWidget> {
  bool _isFirstPage = true;
  bool _isPasswordVisible = false;

  late final FocusNode _emailNode;
  late final FocusNode _numberNode;

  @override
  void initState() {
    _emailNode = FocusNode();
    _numberNode = FocusNode();
    super.initState();
  }

  void changePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void changePage(int index) {
    setState(() {
      widget.changeStatus(index);
      _isFirstPage = 0 == index;
    });
  }

  void changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        TabBar(
            indicatorColor: PinkColor.p4,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: false,
            onTap: changePage,
            tabs: [
              SignupPageTabBar(
                isFirstPage: _isFirstPage,
                text: 'Клиент',
                path: IconPath.meditationRound,
              ),
              SignupPageSpecialistTabBar(
                isFirstPage: !_isFirstPage,
                path: IconPath.hand,
              ),
            ]),
        SizedBox(
          height: 30.h,
        ),
        SignupPageTabBarElementWidget(
            emailNode: _emailNode,
            numberNode: _numberNode,
            isPasswordVisible: _isPasswordVisible,
            completeNumber: widget.completeNumber,
            textFieldFormKey: widget.textFieldFormKey,
            nameEditingController: widget.nameEditingController,
            emailEditingController: widget.emailEditingController,
            numberEditingController: widget.numberEditingController,
            passEditingController: widget.passEditingController,
            changePasswordVisibility: changePasswordVisibility,
            changeFocus: changeFocus),
      ]),
    );
  }
}
