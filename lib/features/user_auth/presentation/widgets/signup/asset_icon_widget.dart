import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetIcon extends StatelessWidget {
  final String path;
  Color? color;
  final double size;

  AssetIcon({
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
      size: size.w,
    );
  }
}
