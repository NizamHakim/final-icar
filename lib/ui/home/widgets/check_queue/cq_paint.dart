import 'package:flutter/rendering.dart';
import 'package:icar/ui/core/app_colors.dart';

class CqPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = AppColors.primary600;
    paint.style = PaintingStyle.fill;

    final rect = RRect.fromRectAndCorners(
      Rect.fromLTRB(0, 0, size.width, 150),
      bottomLeft: const Radius.circular(25),
      bottomRight: const Radius.circular(25),
    );

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
