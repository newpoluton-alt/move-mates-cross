

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';

class ActionWidgetCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double radius = 8.r;
    double percentageOfHeight(double percent) => height * percent;
    double percentageOfWidth(double percent) => width * percent;

    Path path = Path();
    path.lineTo(0, height - radius);
    path.quadraticBezierTo(0, height, radius, height);
    path.lineTo(percentageOfWidth(0.42), height - percentageOfHeight(0.21));
    path.lineTo(width - radius, height - percentageOfHeight(0.21));
    path.quadraticBezierTo(width, height - percentageOfHeight(0.21), width,
        height - percentageOfHeight(0.21) - radius);
    path.lineTo(width, radius);
    path.quadraticBezierTo(width, 0, width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(0, 0, 0, radius);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ActionWidgetImageCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double radius = 8.r;
    double percentageOfHeight(double percent) => height * percent;

    Path path = Path();
    path.moveTo(0, radius);
    path.lineTo(0, height - radius);
    path.quadraticBezierTo(0, height, radius, height);
    path.lineTo(width - radius, height - percentageOfHeight(0.21));
    path.quadraticBezierTo(width, height - percentageOfHeight(0.21) - 2.h,
        width, height - percentageOfHeight(0.21) - radius);
    path.lineTo(width, radius);
    path.quadraticBezierTo(width, 0, width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(0, 0, 0, radius);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ActionWidgetCustomPainter extends StatelessWidget {
  final Widget child;
  final CustomPainter customPainter;

  const ActionWidgetCustomPainter({
    super.key,
    required this.child,
    required this.customPainter,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: customPainter,
      child: child,
    );
  }
}

class ActionWidgetShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ActionWidgetShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = shadow.toPaint();
    Path clipRect = clipper.getClip(size).shift(Offset(0, 5.h));
    canvas.drawPath(clipRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ActionWidgetBorderPainter extends CustomPainter {
  final CustomClipper<Path> clipper;

  ActionWidgetBorderPainter({required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.w
      ..color = PinkColor.p1;
    Path clipRect = clipper.getClip(size).shift(Offset.zero);
    canvas.drawPath(clipRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}