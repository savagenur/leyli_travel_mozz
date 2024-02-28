import 'package:flutter/material.dart';

class VerticalDashedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double dashHeight;
  final double dashWidth;
  final double dashSpace;

  VerticalDashedLine({
    required this.height,
    this.color = Colors.black,
    this.dashHeight = 5.0,
    this.dashWidth = 1.0,
    this.dashSpace = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(dashWidth, height),
      painter: _VerticalDashedLinePainter(
        color,
        dashHeight,
        dashSpace,
        dashWidth,
      ),
    );
  }
}

class _VerticalDashedLinePainter extends CustomPainter {
  final Color color;
  final double dashHeight;
  final double dashWidth;
  final double dashSpace;

  _VerticalDashedLinePainter(
    this.color,
    this.dashHeight,
    this.dashSpace,
    this.dashWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = dashWidth
      ..strokeCap = StrokeCap.square;

    final double dashTotalHeight = dashHeight + dashSpace;

    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashTotalHeight;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
