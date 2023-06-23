import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/signup_tab_bar_widget.dart';
import 'package:move_mates_android/ui/login_and_signup/signup/tab_bar_element_widget.dart';

import '../../theme/colors.dart';
import '../constants.dart';

class TabViewWidget extends StatefulWidget {
  final GlobalKey<FormState> textFieldFormKey;
  final GlobalKey<FormState> textFieldFormKeySecond;

  const TabViewWidget({super.key,
    required this.textFieldFormKey,
    required this.textFieldFormKeySecond});

  @override
  State<TabViewWidget> createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget> {
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
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
                indicatorColor: ValidationColor.indicatorColor,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: false,
                onTap: changePage,
                tabs: [
                  SignupTabBar(
                    isFirstPage: _isFirstPage,
                    text: 'Клиент',
                    path: IconPath.meditationRound,
                  ),
                  SignupTabBar(
                    isFirstPage: !_isFirstPage,
                    text: 'Tренер',
                    path: IconPath.dumbbellLarge,
                  ),
                ]),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 370.h,
              child: TabBarView(children: [
                TabBarElementWidget(emailNode: _emailNode,
                    numberNode: _numberNode,
                    isPasswordVisible: _isPasswordVisible,
                    textFieldFormKey: widget.textFieldFormKey,
                    changePasswordVisibility: changePasswordVisibility,
                    changeFocus: changeFocus),

                TabBarElementWidget(emailNode: _emailNode,
                    numberNode: _numberNode,
                    isPasswordVisible: _isPasswordVisible,
                    textFieldFormKey: widget.textFieldFormKeySecond,
                    changePasswordVisibility: changePasswordVisibility,
                    changeFocus: changeFocus)
              ]),
            )
          ]),
    );
  }
}
