import 'package:flutter/rendering.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class CheckQueuePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = AppColors.white;
    paint.style = PaintingStyle.fill;

    double radius = 60;
    final path = Path();

    path.moveTo(0, size.height * 0.5);
    path.arcToPoint(
      Offset(radius, size.height * 0.65),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width - radius, size.height * 0.65);
    path.arcToPoint(
      Offset(size.width, size.height * 0.5),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
