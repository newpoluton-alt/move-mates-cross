

import 'package:flutter/material.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/green_color.dart';
import '../signup_page/signup_page_asset_icon_widget.dart';

class AuthPageBackButtonWidget extends StatelessWidget {
  const AuthPageBackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: SignupPageAssetIconWidget(
          path: IconPath.arrowBack,
          color: GreenColor.g1,
        ));
  }
}
