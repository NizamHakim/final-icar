import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:icar/data/core/providers/notifications_plugin/notifications_plugin.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/data/core/providers/shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initialization.g.dart';

@riverpod
class AppInitialization extends _$AppInitialization {
  @override
  Future<void> build() async {
    await dotenv.load(fileName: ".env");
    await ref.read(initializeSharedPreferencesProvider.future);
    ref.read(currentLocaleProvider);
    await ref.read(initializeCurrentUserProvider.future);
    await ref.read(initializeNotificationsPluginProvider.future);
  }
}
