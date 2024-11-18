
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LBTimeLinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..color = Colors.red;
    canvas.translate(0, 0);
    print("LBLog size is ${size}");
    canvas.drawCircle(Offset.zero, 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}