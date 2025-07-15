import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/user_location/user_location.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_stop_repository/local/icar_stop_local_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/remote/icar_stop_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stop_viewmodel.g.dart';

@riverpod
Future<List<IcarStop>> icarStopOptionsRaw(Ref ref) async {
  final stopRepository = ref.watch(icarStopRemoteRepositoryProvider);
  final userPosition = await ref.watch(userLocationProvider.future);
  final icarStopOptionsEither = await stopRepository.getStops(userPosition);

  return icarStopOptionsEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (icarStopOptions) {
      return icarStopOptions;
    },
  );
}

@riverpod
class SearchStopValue extends _$SearchStopValue {
  @override
  String build() {
    return "";
  }

  void setSearchValue(String value) {
    state = value;
  }
}

@riverpod
Future<List<IcarStop>> filteredIcarStopOptions(Ref ref) async {
  final unfilteredIcarStopOptions = await ref.watch(
    icarStopOptionsRawProvider.future,
  );
  final searchStopValue = ref.watch(searchStopValueProvider);

  return unfilteredIcarStopOptions
      .where(
        (icarStopOption) => icarStopOption.name.toLowerCase().contains(
          searchStopValue.toLowerCase(),
        ),
      )
      .toList();
}

@riverpod
Future<List<IcarStop>> icarStopOptionsFromHistory(Ref ref) async {
  final icarStopLocalRepository = ref.watch(icarStopLocalRepositoryProvider);
  final icarIdsHistory = icarStopLocalRepository.getStopsIdHistory();

  final unfilteredIcarStopOptions = await ref.watch(
    icarStopOptionsRawProvider.future,
  );

  return unfilteredIcarStopOptions
      .where((icarStopOption) => icarIdsHistory.contains(icarStopOption.id))
      .toList();
}

@riverpod
class SelectedStop extends _$SelectedStop {
  @override
  IcarStop? build() {
    return null;
  }

  void setSelectedStop(IcarStop stop) {
    final icarStopLocalRepository = ref.watch(icarStopLocalRepositoryProvider);
    icarStopLocalRepository.addStopIdToHistory(stop.id);
    state = stop;
  }
}
