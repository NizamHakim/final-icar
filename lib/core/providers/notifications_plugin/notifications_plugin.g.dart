// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_plugin.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initializeNotificationsPluginHash() =>
    r'c4e85388b18c18f24bee3ed2677c9a1da74ac334';

/// See also [initializeNotificationsPlugin].
@ProviderFor(initializeNotificationsPlugin)
final initializeNotificationsPluginProvider =
    AutoDisposeFutureProvider<void>.internal(
      initializeNotificationsPlugin,
      name: r'initializeNotificationsPluginProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$initializeNotificationsPluginHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InitializeNotificationsPluginRef = AutoDisposeFutureProviderRef<void>;
String _$launchedWithNotificationHash() =>
    r'57a534e9810ddbb86b9c17c9a4f4f90c7746ded5';

/// See also [launchedWithNotification].
@ProviderFor(launchedWithNotification)
final launchedWithNotificationProvider =
    AutoDisposeFutureProvider<void>.internal(
      launchedWithNotification,
      name: r'launchedWithNotificationProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$launchedWithNotificationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LaunchedWithNotificationRef = AutoDisposeFutureProviderRef<void>;
String _$notificationsPluginHash() =>
    r'c8567b22890de4319a20dd87115a5e0fa0ea57fa';

/// See also [NotificationsPlugin].
@ProviderFor(NotificationsPlugin)
final notificationsPluginProvider = NotifierProvider<
  NotificationsPlugin,
  FlutterLocalNotificationsPlugin?
>.internal(
  NotificationsPlugin.new,
  name: r'notificationsPluginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationsPluginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsPlugin = Notifier<FlutterLocalNotificationsPlugin?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
