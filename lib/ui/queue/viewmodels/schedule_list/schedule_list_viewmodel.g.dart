// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarStopHash() => r'03432935218686a6638b8a35fccf636a7af44500';

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

/// See also [icarStop].
@ProviderFor(icarStop)
const icarStopProvider = IcarStopFamily();

/// See also [icarStop].
class IcarStopFamily extends Family<AsyncValue<IcarStop>> {
  /// See also [icarStop].
  const IcarStopFamily();

  /// See also [icarStop].
  IcarStopProvider call(int icarStopId) {
    return IcarStopProvider(icarStopId);
  }

  @override
  IcarStopProvider getProviderOverride(covariant IcarStopProvider provider) {
    return call(provider.icarStopId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'icarStopProvider';
}

/// See also [icarStop].
class IcarStopProvider extends AutoDisposeFutureProvider<IcarStop> {
  /// See also [icarStop].
  IcarStopProvider(int icarStopId)
    : this._internal(
        (ref) => icarStop(ref as IcarStopRef, icarStopId),
        from: icarStopProvider,
        name: r'icarStopProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarStopHash,
        dependencies: IcarStopFamily._dependencies,
        allTransitiveDependencies: IcarStopFamily._allTransitiveDependencies,
        icarStopId: icarStopId,
      );

  IcarStopProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.icarStopId,
  }) : super.internal();

  final int icarStopId;

  @override
  Override overrideWith(
    FutureOr<IcarStop> Function(IcarStopRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IcarStopProvider._internal(
        (ref) => create(ref as IcarStopRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        icarStopId: icarStopId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IcarStop> createElement() {
    return _IcarStopProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarStopProvider && other.icarStopId == icarStopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, icarStopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IcarStopRef on AutoDisposeFutureProviderRef<IcarStop> {
  /// The parameter `icarStopId` of this provider.
  int get icarStopId;
}

class _IcarStopProviderElement
    extends AutoDisposeFutureProviderElement<IcarStop>
    with IcarStopRef {
  _IcarStopProviderElement(super.provider);

  @override
  int get icarStopId => (origin as IcarStopProvider).icarStopId;
}

String _$icarRouteHash() => r'bed576e7b80c02ba99d1d13dd494cb6a6042ba6d';

/// See also [icarRoute].
@ProviderFor(icarRoute)
const icarRouteProvider = IcarRouteFamily();

/// See also [icarRoute].
class IcarRouteFamily extends Family<AsyncValue<IcarRoute>> {
  /// See also [icarRoute].
  const IcarRouteFamily();

  /// See also [icarRoute].
  IcarRouteProvider call(int icarRouteId) {
    return IcarRouteProvider(icarRouteId);
  }

  @override
  IcarRouteProvider getProviderOverride(covariant IcarRouteProvider provider) {
    return call(provider.icarRouteId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'icarRouteProvider';
}

/// See also [icarRoute].
class IcarRouteProvider extends AutoDisposeFutureProvider<IcarRoute> {
  /// See also [icarRoute].
  IcarRouteProvider(int icarRouteId)
    : this._internal(
        (ref) => icarRoute(ref as IcarRouteRef, icarRouteId),
        from: icarRouteProvider,
        name: r'icarRouteProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarRouteHash,
        dependencies: IcarRouteFamily._dependencies,
        allTransitiveDependencies: IcarRouteFamily._allTransitiveDependencies,
        icarRouteId: icarRouteId,
      );

  IcarRouteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.icarRouteId,
  }) : super.internal();

  final int icarRouteId;

  @override
  Override overrideWith(
    FutureOr<IcarRoute> Function(IcarRouteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IcarRouteProvider._internal(
        (ref) => create(ref as IcarRouteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        icarRouteId: icarRouteId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IcarRoute> createElement() {
    return _IcarRouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarRouteProvider && other.icarRouteId == icarRouteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, icarRouteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IcarRouteRef on AutoDisposeFutureProviderRef<IcarRoute> {
  /// The parameter `icarRouteId` of this provider.
  int get icarRouteId;
}

class _IcarRouteProviderElement
    extends AutoDisposeFutureProviderElement<IcarRoute>
    with IcarRouteRef {
  _IcarRouteProviderElement(super.provider);

  @override
  int get icarRouteId => (origin as IcarRouteProvider).icarRouteId;
}

String _$scheduleListHash() => r'ee21ad9845a562ac66f68e5f86870ec76e22acbc';

/// See also [scheduleList].
@ProviderFor(scheduleList)
const scheduleListProvider = ScheduleListFamily();

/// See also [scheduleList].
class ScheduleListFamily extends Family<AsyncValue<List<Schedule>>> {
  /// See also [scheduleList].
  const ScheduleListFamily();

  /// See also [scheduleList].
  ScheduleListProvider call({
    required int icarStopId,
    required int icarRouteId,
  }) {
    return ScheduleListProvider(
      icarStopId: icarStopId,
      icarRouteId: icarRouteId,
    );
  }

  @override
  ScheduleListProvider getProviderOverride(
    covariant ScheduleListProvider provider,
  ) {
    return call(
      icarStopId: provider.icarStopId,
      icarRouteId: provider.icarRouteId,
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
  String? get name => r'scheduleListProvider';
}

/// See also [scheduleList].
class ScheduleListProvider extends AutoDisposeFutureProvider<List<Schedule>> {
  /// See also [scheduleList].
  ScheduleListProvider({required int icarStopId, required int icarRouteId})
    : this._internal(
        (ref) => scheduleList(
          ref as ScheduleListRef,
          icarStopId: icarStopId,
          icarRouteId: icarRouteId,
        ),
        from: scheduleListProvider,
        name: r'scheduleListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$scheduleListHash,
        dependencies: ScheduleListFamily._dependencies,
        allTransitiveDependencies:
            ScheduleListFamily._allTransitiveDependencies,
        icarStopId: icarStopId,
        icarRouteId: icarRouteId,
      );

  ScheduleListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.icarStopId,
    required this.icarRouteId,
  }) : super.internal();

  final int icarStopId;
  final int icarRouteId;

  @override
  Override overrideWith(
    FutureOr<List<Schedule>> Function(ScheduleListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleListProvider._internal(
        (ref) => create(ref as ScheduleListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        icarStopId: icarStopId,
        icarRouteId: icarRouteId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Schedule>> createElement() {
    return _ScheduleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleListProvider &&
        other.icarStopId == icarStopId &&
        other.icarRouteId == icarRouteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, icarStopId.hashCode);
    hash = _SystemHash.combine(hash, icarRouteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ScheduleListRef on AutoDisposeFutureProviderRef<List<Schedule>> {
  /// The parameter `icarStopId` of this provider.
  int get icarStopId;

  /// The parameter `icarRouteId` of this provider.
  int get icarRouteId;
}

class _ScheduleListProviderElement
    extends AutoDisposeFutureProviderElement<List<Schedule>>
    with ScheduleListRef {
  _ScheduleListProviderElement(super.provider);

  @override
  int get icarStopId => (origin as ScheduleListProvider).icarStopId;
  @override
  int get icarRouteId => (origin as ScheduleListProvider).icarRouteId;
}

String _$createNewTicketHash() => r'e9f20f1b353a1086482116288a62666bf574f7ec';

/// See also [CreateNewTicket].
@ProviderFor(CreateNewTicket)
final createNewTicketProvider =
    AutoDisposeAsyncNotifierProvider<CreateNewTicket, Ticket?>.internal(
      CreateNewTicket.new,
      name: r'createNewTicketProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createNewTicketHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateNewTicket = AutoDisposeAsyncNotifier<Ticket?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
