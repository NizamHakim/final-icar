import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'icar_stop_local_repository.g.dart';

@riverpod
IcarStopLocalRepository icarStopLocalRepository(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesInstanceProvider)!;
  return IcarStopLocalRepository(sharedPreferences: sharedPreferences);
}

class IcarStopLocalRepository {
  const IcarStopLocalRepository({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  List<int> getStopsIdHistory() {
    List<String>? stopsIdHistory = sharedPreferences.getStringList(
      "stopsIdHistory",
    );

    if (stopsIdHistory == null) {
      return [];
    }

    return stopsIdHistory.map((e) => int.parse(e)).toList();
  }

  void addStopIdToHistory(int stopId) {
    List<String>? stopsIdHistory = sharedPreferences.getStringList(
      "stopsIdHistory",
    );

    stopsIdHistory ??= [];

    if (!stopsIdHistory.contains(stopId.toString())) {
      if (stopsIdHistory.length >= 3) {
        stopsIdHistory.removeAt(0);
      }
      stopsIdHistory.add(stopId.toString());
      sharedPreferences.setStringList("stopsIdHistory", stopsIdHistory);
    }
  }
}
