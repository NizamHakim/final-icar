import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;
    double heightStart = 135;
    double heightEnd = 165;

    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, heightStart);
    path.arcToPoint(
      Offset(size.width, heightEnd),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, heightEnd);
    path.arcToPoint(
      Offset(0, heightStart),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
