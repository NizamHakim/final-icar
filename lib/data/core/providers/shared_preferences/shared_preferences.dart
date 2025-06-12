import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@Riverpod(keepAlive: true)
class SharedPreferencesInstance extends _$SharedPreferencesInstance {
  @override
  SharedPreferences? build() {
    return null;
  }

  void setInstance(SharedPreferences instance) {
    state = instance;
  }
}

@riverpod
Future<void> initializeSharedPreferences(Ref ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  ref
      .read(sharedPreferencesInstanceProvider.notifier)
      .setInstance(sharedPreferences);
}
