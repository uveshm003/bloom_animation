import 'package:flutter/material.dart';

import 'dart:math' as math;

const _PETAL_COUNT = 10;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const stemTop = Offset.zero;
    const stemBottom = Offset(0, 400);

    canvas.drawLine(
      stemTop,
      stemBottom,
      Paint()
        ..color = Colors.green.shade900
        ..strokeWidth = 25,
    );

    const sweepAngleDiff = math.pi / (_PETAL_COUNT - 1);

    for (int i = 0; i < _PETAL_COUNT; i++) {
      final angle = (math.pi / 2) + (i * sweepAngleDiff);
      canvas.save();
      canvas.rotate(angle);
      canvas.drawOval(
        Rect.fromCenter(center: stemTop, width: 70, height: 250),
        Paint()..color = Colors.pink.withOpacity(.75),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
