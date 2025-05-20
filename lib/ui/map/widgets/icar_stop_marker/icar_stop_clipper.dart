import 'package:flutter/material.dart';

class IcarStopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double arrowWidth = 6;
    double arrowHeight = 6;
    double boxRadius = 4;

    Path path = Path();

    path.moveTo(0, boxRadius);
    path.arcToPoint(
      Offset(boxRadius, 0),
      radius: Radius.circular(boxRadius),
      clockwise: true,
    );
    path.lineTo(size.width - boxRadius, 0);
    path.arcToPoint(
      Offset(size.width, boxRadius),
      radius: Radius.circular(boxRadius),
      clockwise: true,
    );
    path.lineTo(size.width, size.height - (boxRadius + arrowHeight));
    path.arcToPoint(
      Offset(size.width - boxRadius, size.height - arrowHeight),
      radius: Radius.circular(boxRadius),
      clockwise: true,
    );
    path.lineTo((size.width / 2) + (arrowWidth / 2), size.height - arrowHeight);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      (size.width / 2) - (arrowWidth / 2),
      size.height - arrowHeight,
    );
    path.lineTo(boxRadius, size.height - arrowHeight);
    path.arcToPoint(
      Offset(0, size.height - (boxRadius + arrowHeight)),
      radius: Radius.circular(boxRadius),
      clockwise: true,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
