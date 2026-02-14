// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SoftGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xffFF470B).withOpacity(0.60),
          const Color(0xffFF470B),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
