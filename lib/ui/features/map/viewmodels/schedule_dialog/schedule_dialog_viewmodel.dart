import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/user_location/user_location.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_repository/icar/icar_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/remote/icar_stop_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_dialog_viewmodel.g.dart';

@riverpod
Future<IcarStop> icarStopDetail(Ref ref, int icarStopId) async {
  final stopRepository = ref.watch(icarStopRemoteRepositoryProvider);
  final userPosition = await ref.watch(userLocationProvider.future);
  final stopEither = await stopRepository.getStopById(icarStopId, userPosition);

  return stopEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (stop) {
      return stop;
    },
  );
}

@riverpod
Future<List<Icar>> icarWithSchedulesList(Ref ref, int icarStopId) async {
  final icarRepository = ref.watch(icarRepositoryProvider);
  final icarListEither = await icarRepository.getIcarsWithScheduleByStopId(
    icarStopId,
  );

  return icarListEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (icarListData) {
      return icarListData;
    },
  );
}

@riverpod
class IsShowingDetail extends _$IsShowingDetail {
  @override
  bool build() {
    return false;
  }

  void showDetail() {
    state = true;
  }

  void hideDetail() {
    state = false;
  }
}
