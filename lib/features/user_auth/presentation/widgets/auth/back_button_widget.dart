

import 'package:flutter/material.dart';

import '../../../../../config/routes/assets_routes.dart';
import '../../../../../config/theme/colors/green_color.dart';
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
          color: GreenColor.g1,
        ));
  }
}
