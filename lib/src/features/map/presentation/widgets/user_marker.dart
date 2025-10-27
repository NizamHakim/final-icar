import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class UserMarker extends StatelessWidget {
  const UserMarker({super.key, required this.position});

  final Position position;

  @override
  Widget build(BuildContext context) {
    return AnimatedLocationMarkerLayer(
      position: LocationMarkerPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
      ),
      style: const LocationMarkerStyle(
        marker: _UserMarker(),
        markerSize: Size(36, 42),
        markerDirection: MarkerDirection.top,
        markerAlignment: Alignment.topCenter,
        showHeadingSector: false,
      ),
    );
  }
}

class _UserMarker extends StatelessWidget {
  const _UserMarker();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _UserClipper(),
      child: Container(
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 4,
          bottom: 4 + 6,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.rectangle,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary500,
            shape: BoxShape.circle,
          ),
          child: const AppIcon(
            iconSvg: AppIconsSvg.personHand,
            color: AppColors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}

class _UserClipper extends CustomClipper<Path> {
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
