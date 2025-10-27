import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/shared/presentation/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'icar_stop_local_datasource.g.dart';

@riverpod
IcarStopLocalDatasource icarStopLocalDatasource(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return IcarStopLocalDatasource(sharedPreferences);
}

class IcarStopLocalDatasource {
  final SharedPreferences _sharedPreferences;

  IcarStopLocalDatasource(this._sharedPreferences);

  List<int> getStopsId() {
    List<String>? stopsIdHistory = _sharedPreferences.getStringList(
      "stopsIdHistory",
    );

    if (stopsIdHistory == null) {
      return [];
    }

    return stopsIdHistory.map((stopId) => int.parse(stopId)).toList();
  }

  void addStopId(int stopId) {
    List<String>? stopsIdHistory = _sharedPreferences.getStringList(
      "stopsIdHistory",
    );

    stopsIdHistory ??= [];

    if (!stopsIdHistory.contains(stopId.toString())) {
      if (stopsIdHistory.length >= 3) {
        stopsIdHistory.removeAt(0);
      }
      stopsIdHistory.add(stopId.toString());
      _sharedPreferences.setStringList("stopsIdHistory", stopsIdHistory);
    }
  }
}
