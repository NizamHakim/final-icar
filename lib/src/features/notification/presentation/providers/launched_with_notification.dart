import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/notification/presentation/providers/handle_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:icar/src/features/notification/presentation/providers/notifications_plugin.dart';
import 'package:icar/src/features/notification/domain/entities/notification_payload.dart';

part 'launched_with_notification.g.dart';

@riverpod
Future<void> launchedWithNotification(Ref ref) async {
  final notificationPlugin =
      ref.watch(notificationsPluginProvider).requireValue;
  final notificationAppLaunchDetails =
      await notificationPlugin.getNotificationAppLaunchDetails();

  if (notificationAppLaunchDetails!.didNotificationLaunchApp) {
    final payload = NotificationPayload.fromJson(
      jsonDecode(notificationAppLaunchDetails.notificationResponse!.payload!),
    );
    handleNotification(payload);
  }
}
