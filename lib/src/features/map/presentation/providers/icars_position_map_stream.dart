import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/features/map/presentation/providers/handle_icar_disconnected.dart';
import 'package:icar/src/shared/domain/repositories/icar_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icars_position_map_stream.g.dart';

@Riverpod(keepAlive: true)
Stream<Map<int, Position>> icarsPositionMapStream(Ref ref) async* {
  final icarRepository = ref.watch(icarRepositoryProvider);
  final Map<int, Position> icarPositionMap = {};
  final icarPositionStream = icarRepository.getIcarPositionStream();

  await for (final (type, icarPosition, canceledTickets)
      in icarPositionStream) {
    if (type == "position") {
      icarPositionMap[icarPosition.id] = icarPosition.position!;
      yield icarPositionMap;
    } else if (type == "disconnect") {
      handleIcarDisconnected(ref, icarPosition, canceledTickets!);
      icarPositionMap.remove(icarPosition.id);
      yield icarPositionMap;
    }
  }
}
