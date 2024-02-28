import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double dashWidth;
  final double dashSpace;
  
  DashedLine({
    required this.height,
    required this.width,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _DashedLinePainter(color, dashWidth, dashSpace),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  _DashedLinePainter(this.color, this.dashWidth, this.dashSpace);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..style = PaintingStyle.stroke;

    final double dashTotalWidth = dashWidth + dashSpace;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashTotalWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
