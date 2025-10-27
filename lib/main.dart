import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/app.dart';
import 'package:icar/src/utils/di.dart';
import 'package:icar/src/features/notification/presentation/providers/notifications_plugin.dart';
import 'package:icar/src/shared/presentation/providers/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final (sharedPreferences, notificationPlugin) = await di();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
        notificationsPluginProvider.overrideWith((ref) => notificationPlugin),
      ],
      child: const App(),
    ),
  );
}
