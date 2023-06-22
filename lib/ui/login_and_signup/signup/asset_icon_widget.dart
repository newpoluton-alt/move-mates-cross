import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetIcon extends StatelessWidget {
  final String path;
  final Color color;

  const AssetIcon({
    super.key,
    required this.path,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(path),
      color: color,
      size: 24.w,
    );
  }
}