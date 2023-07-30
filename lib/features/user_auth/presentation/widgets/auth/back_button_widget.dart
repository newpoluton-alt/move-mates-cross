

import 'package:flutter/material.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../../config/routes/assets_routes.dart';
import '../signup/asset_icon_widget.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: AssetIcon(
          path: IconPath.arrowBack,
          color: ValidationColor.signInAndSignup,
        ));
  }
}
