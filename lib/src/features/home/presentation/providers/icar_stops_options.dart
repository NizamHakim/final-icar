import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/home/presentation/providers/search_stop.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/domain/repositories/icar_stop_repository.dart';
import 'package:icar/src/shared/presentation/providers/icar_stops.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stops_options.g.dart';

@riverpod
Future<List<IcarStop>> icarStopsOptions(Ref ref) async {
  final icarStopsOptionsRaw = await ref.watch(icarStopsProvider.future);
  final searchStop = ref.watch(searchStopProvider);

  return icarStopsOptionsRaw
      .where(
        (icarStopOption) => icarStopOption.name.toLowerCase().contains(
          searchStop.toLowerCase(),
        ),
      )
      .toList();
}

@riverpod
Future<List<IcarStop>> icarStopsOptionsFromHistory(Ref ref) async {
  final icarStopRepository = ref.watch(icarStopRepositoryProvider);
  final icarIdsHistory = icarStopRepository.getStopsHistory();

  final icarStopsOptionsRaw = await ref.watch(icarStopsProvider.future);

  return icarStopsOptionsRaw
      .where((icarStopOption) => icarIdsHistory.contains(icarStopOption.id))
      .toList();
}

final fakeIcarStops = List.generate(
  6,
  (index) => const IcarStop(
    id: 0,
    name: "Dummy Stop",
    coordinate: LatLng(0, 0),
    distance: 0,
    duration: Duration(seconds: 0),
  ),
);
