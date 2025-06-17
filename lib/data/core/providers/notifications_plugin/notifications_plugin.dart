import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

part 'notifications_plugin.g.dart';

@Riverpod(keepAlive: true)
class NotificationsPlugin extends _$NotificationsPlugin {
  @override
  FlutterLocalNotificationsPlugin? build() {
    return null;
  }

  void setPlugin(FlutterLocalNotificationsPlugin? notificationsPlugin) async {
    state = notificationsPlugin;
  }
}

@riverpod
Future<void> initializeNotificationsPlugin(Ref ref) async {
  initializeTimeZones();
  setLocalLocation(getLocation('Asia/Jakarta'));

  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  const androidSettings = AndroidInitializationSettings(
    '@mipmap/launcher_icon',
  );
  const iosSettings = DarwinInitializationSettings();
  const initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await notificationsPlugin.initialize(initializationSettings);

  ref.read(notificationsPluginProvider.notifier).setPlugin(notificationsPlugin);
}
