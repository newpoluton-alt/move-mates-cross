import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/core/constants/user_auth/user_auth_constants.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/user_auth/auth_text_style.dart';
import 'asset_icon_widget.dart';

class SignUpSpecialistTabBar extends StatefulWidget {
  final bool isFirstPage;
  final String path;

  const   SignUpSpecialistTabBar({
    super.key,
    required this.isFirstPage,
    required this.path,
  });

  @override
  State<SignUpSpecialistTabBar> createState() => _SignUpSpecialistTabBarState();
}

class _SignUpSpecialistTabBarState extends State<SignUpSpecialistTabBar> {
  TextStyle _selectedMainStyle(
      {required bool isFirstPage, required bool isCurrent}) {
    return !isFirstPage
        ? ValidationTextStyle.toolBarRegularSemiBold
        : isCurrent
            ? ValidationTextStyle.toolBarRegularSemiBoldSelected
            : ValidationTextStyle.toolBarRegularSemiBold;
  }

late  List<String> items;
@override
  void initState() {
  items = List.from(UserAuthWidgetConstants.authDropDownItemData);
  super.initState();
  }
  String get currentItem => items.first;
void changeOrderOfItems(String? value) {
  if (value == null) return;
  setState(() {
    var tempCurrent = items[items.indexOf(value)];
    items[items.indexOf(value)] = items.first;
    items.first = tempCurrent;
  });
}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AssetIcon(
              path: widget.path,
              color:
                  widget.isFirstPage ? PinkColor.p4 : Colors.black),
          SizedBox(
            width: 10.w,
          ),
          DropdownButton(
            value: currentItem,
            isDense: true,
            disabledHint: Text(currentItem,
                style: ValidationTextStyle.toolBarRegularSemiBold,
            ),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(7.r),
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: widget.isFirstPage ? PinkColor.p4 : Colors.black,
            ),
            items: !widget.isFirstPage?null: items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e,
                          style: _selectedMainStyle(
                            isFirstPage: widget.isFirstPage,
                            isCurrent: e == currentItem,
                          )),
                    ))
                .toList(),
            onChanged: changeOrderOfItems,
          )
        ],
      ),
    );
  }
}


