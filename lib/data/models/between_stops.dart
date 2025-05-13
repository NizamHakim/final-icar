import 'package:icar/data/models/icar_stop.dart';

class BetweenStops {
  const BetweenStops({
    required this.id,
    required this.stopA,
    required this.stopB,
    required this.distance,
    required this.estimatedTime,
  });

  final int id;
  final IcarStop stopA;
  final IcarStop stopB;
  final double distance;
  final DateTime estimatedTime;
}
