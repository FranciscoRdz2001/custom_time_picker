import 'package:flutter/material.dart';

class LinePaint extends CustomPainter {
  final Offset linePos;
  LinePaint({
    required this.linePos,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlue[200]!
      ..strokeWidth = 5;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(100, 100)
      ..lineTo(0, 100)
      ..lineTo(0, 0);
    path.close();
    canvas.drawLine(Offset.zero, Offset(linePos.dx, linePos.dy), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
