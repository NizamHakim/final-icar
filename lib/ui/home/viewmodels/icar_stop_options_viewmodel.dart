import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/user_location.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stop_options_viewmodel.g.dart';

@riverpod
Future<List<IcarStop>> icarStopOptionsRaw(Ref ref) async {
  final stopRepository = ref.watch(icarStopRepositoryProvider);
  final userPosition = await ref.watch(userLocationProvider.future);
  final icarStopOptionsEither = await stopRepository.getAllStops(userPosition);

  return icarStopOptionsEither.fold(
    (failure) {
      throw Exception(failure.message);
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
  final icarIdsHistory = [1, 2, 3];
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
    state = stop;
  }
}
