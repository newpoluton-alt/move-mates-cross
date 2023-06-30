

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';
import 'signup/asset_icon_widget.dart';

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
        icon: const AssetIcon(
          path: IconPath.arrowBack,
          color: ValidationColor.signInAndSignup,
        ));
  }
}
