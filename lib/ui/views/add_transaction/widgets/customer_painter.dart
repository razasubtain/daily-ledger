import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const space = 4.0; // Adjust this value to control the spacing between dots
    const dashWidth = 2.0; // Adjust this value to control the width of each dot
    const dashHeight =
        1.0; // Adjust this value to control the height of each dot

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + space;
    }

    // Right line
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width, startY),
        Offset(size.width, startY + dashHeight),
        paint,
      );
      startY += dashHeight + space;
    }

    // Bottom line
    startX = size.width;
    while (startX > 0) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX - dashWidth, size.height),
        paint,
      );
      startX -= dashWidth + space;
    }

    // Left line
    startY = size.height;
    while (startY > 0) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY - dashHeight),
        paint,
      );
      startY -= dashHeight + space;
    }
  }

  @override
  bool shouldRepaint(DottedBorderPainter oldDelegate) => false;
}
