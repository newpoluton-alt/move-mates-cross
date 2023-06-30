import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetIcon extends StatelessWidget {
  final String path;
  final Color color;
  final double size;
   const AssetIcon({
    super.key,
    this.size = 24,
    required this.path,
    required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(path),
      color: color,
      size: size.w,
    );
  }
}