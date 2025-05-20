import 'dart:math';

import 'package:flutter/material.dart';

class UserClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // 0 from right mid
    double startAngle = 120;
    double sweepAngle = 300;

    Path path = Path();

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.width);
    path.addArc(rect, startAngle * (pi / 180), sweepAngle * (pi / 180));
    path.lineTo(size.width / 2, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
