
import 'package:flutter/material.dart';
class LBDashedLine extends CustomPainter {
  final Paint _paint;
  final List<double> dashArray;

  LBDashedLine({
    required Color color,
    required double strokeWidth,
    required this.dashArray,
  }) : _paint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final double startPoint = 0.0;
    final double endPoint = size.width;

    path.moveTo(startPoint, size.height / 2);
    path.lineTo(endPoint, size.height / 2);

    for (int i = 0; i < dashArray.length; i += 2) {
      _paint.strokeWidth = dashArray[i];
      canvas.drawPath(path, _paint);
      canvas.translate(dashArray[i] + dashArray[i + 1], 0.0);
    }
  }

  @override
  bool shouldRepaint(LBDashedLine oldDelegate) {
    return _paint != oldDelegate._paint;
  }
}

// class DashedLineWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(200, 20),
//       painter: DashedLine(
//         color: Colors.black,
//         strokeWidth: 2.0,
//         dashArray: <double>[3.0, 2.0],
//       ),
//     );
//   }
// }
