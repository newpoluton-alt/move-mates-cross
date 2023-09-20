import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SignupPageAssetIconWidget extends StatelessWidget {
  final String path;
  Color? color;
  final double size;

  SignupPageAssetIconWidget({
    super.key,
    this.size = 24,
    this.color,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(path),
      color: color,
      size: size.r,
    );
  }
}
