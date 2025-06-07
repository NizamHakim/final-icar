import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_repository/icar_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_dialog_viewmodel.g.dart';

@riverpod
Future<IcarStop> icarStopDetail(
  Ref ref,
  IcarStop icarStop,
  Position userPosition,
) async {
  final stopRepository = ref.watch(icarStopRepositoryProvider);
  final stopEither = await stopRepository.getStopById(icarStop, userPosition);

  return stopEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (stop) {
      return stop;
    },
  );
}

@riverpod
Future<List<Icar>> icarWithSchedulesList(Ref ref, IcarStop icarStop) async {
  final icarRepository = ref.watch(icarRepositoryProvider);
  final icarListEither = await icarRepository.getIcarsWithScheduleByStopId(
    icarStop,
  );

  return icarListEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (icarListData) {
      return icarListData;
    },
  );
}
