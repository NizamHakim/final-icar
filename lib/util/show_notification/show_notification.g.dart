// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_notification.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showNotificationHash() => r'9aaef4fffbd2c79cfffca75959bffdd4e25fc048';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [showNotification].
@ProviderFor(showNotification)
const showNotificationProvider = ShowNotificationFamily();

/// See also [showNotification].
class ShowNotificationFamily extends Family<AsyncValue<void>> {
  /// See also [showNotification].
  const ShowNotificationFamily();

  /// See also [showNotification].
  ShowNotificationProvider call(int id, String title, String body) {
    return ShowNotificationProvider(id, title, body);
  }

  @override
  ShowNotificationProvider getProviderOverride(
    covariant ShowNotificationProvider provider,
  ) {
    return call(provider.id, provider.title, provider.body);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'showNotificationProvider';
}

/// See also [showNotification].
class ShowNotificationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [showNotification].
  ShowNotificationProvider(int id, String title, String body)
    : this._internal(
        (ref) => showNotification(ref as ShowNotificationRef, id, title, body),
        from: showNotificationProvider,
        name: r'showNotificationProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$showNotificationHash,
        dependencies: ShowNotificationFamily._dependencies,
        allTransitiveDependencies:
            ShowNotificationFamily._allTransitiveDependencies,
        id: id,
        title: title,
        body: body,
      );

  ShowNotificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.title,
    required this.body,
  }) : super.internal();

  final int id;
  final String title;
  final String body;

  @override
  Override overrideWith(
    FutureOr<void> Function(ShowNotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowNotificationProvider._internal(
        (ref) => create(ref as ShowNotificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        title: title,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ShowNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowNotificationProvider &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShowNotificationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `body` of this provider.
  String get body;
}

class _ShowNotificationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ShowNotificationRef {
  _ShowNotificationProviderElement(super.provider);

  @override
  int get id => (origin as ShowNotificationProvider).id;
  @override
  String get title => (origin as ShowNotificationProvider).title;
  @override
  String get body => (origin as ShowNotificationProvider).body;
}

String _$showScheduledNotificationHash() =>
    r'2eb4e48b71d8513353190a7668ed6cf010f6d8dd';

/// See also [showScheduledNotification].
@ProviderFor(showScheduledNotification)
const showScheduledNotificationProvider = ShowScheduledNotificationFamily();

/// See also [showScheduledNotification].
class ShowScheduledNotificationFamily extends Family<AsyncValue<void>> {
  /// See also [showScheduledNotification].
  const ShowScheduledNotificationFamily();

  /// See also [showScheduledNotification].
  ShowScheduledNotificationProvider call(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
  ) {
    return ShowScheduledNotificationProvider(id, title, body, scheduledTime);
  }

  @override
  ShowScheduledNotificationProvider getProviderOverride(
    covariant ShowScheduledNotificationProvider provider,
  ) {
    return call(
      provider.id,
      provider.title,
      provider.body,
      provider.scheduledTime,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'showScheduledNotificationProvider';
}

/// See also [showScheduledNotification].
class ShowScheduledNotificationProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [showScheduledNotification].
  ShowScheduledNotificationProvider(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
  ) : this._internal(
        (ref) => showScheduledNotification(
          ref as ShowScheduledNotificationRef,
          id,
          title,
          body,
          scheduledTime,
        ),
        from: showScheduledNotificationProvider,
        name: r'showScheduledNotificationProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$showScheduledNotificationHash,
        dependencies: ShowScheduledNotificationFamily._dependencies,
        allTransitiveDependencies:
            ShowScheduledNotificationFamily._allTransitiveDependencies,
        id: id,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
      );

  ShowScheduledNotificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledTime,
  }) : super.internal();

  final int id;
  final String title;
  final String body;
  final DateTime scheduledTime;

  @override
  Override overrideWith(
    FutureOr<void> Function(ShowScheduledNotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowScheduledNotificationProvider._internal(
        (ref) => create(ref as ShowScheduledNotificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ShowScheduledNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowScheduledNotificationProvider &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.scheduledTime == scheduledTime;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);
    hash = _SystemHash.combine(hash, scheduledTime.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShowScheduledNotificationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `body` of this provider.
  String get body;

  /// The parameter `scheduledTime` of this provider.
  DateTime get scheduledTime;
}

class _ShowScheduledNotificationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ShowScheduledNotificationRef {
  _ShowScheduledNotificationProviderElement(super.provider);

  @override
  int get id => (origin as ShowScheduledNotificationProvider).id;
  @override
  String get title => (origin as ShowScheduledNotificationProvider).title;
  @override
  String get body => (origin as ShowScheduledNotificationProvider).body;
  @override
  DateTime get scheduledTime =>
      (origin as ShowScheduledNotificationProvider).scheduledTime;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
