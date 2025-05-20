// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stopListHash() => r'7d977359c9a22c018d6e8c6d1bc2856de2629867';

/// See also [stopList].
@ProviderFor(stopList)
final stopListProvider = AutoDisposeFutureProvider<List<IcarStop>>.internal(
  stopList,
  name: r'stopListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$stopListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StopListRef = AutoDisposeFutureProviderRef<List<IcarStop>>;
String _$icarStopDetailHash() => r'f3d67cb19280340a51e3bf2ff6b5eae64f4c45ae';

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

/// See also [icarStopDetail].
@ProviderFor(icarStopDetail)
const icarStopDetailProvider = IcarStopDetailFamily();

/// See also [icarStopDetail].
class IcarStopDetailFamily extends Family<AsyncValue<IcarStop>> {
  /// See also [icarStopDetail].
  const IcarStopDetailFamily();

  /// See also [icarStopDetail].
  IcarStopDetailProvider call(IcarStop icarStop, Position userPosition) {
    return IcarStopDetailProvider(icarStop, userPosition);
  }

  @override
  IcarStopDetailProvider getProviderOverride(
    covariant IcarStopDetailProvider provider,
  ) {
    return call(provider.icarStop, provider.userPosition);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'icarStopDetailProvider';
}

/// See also [icarStopDetail].
class IcarStopDetailProvider extends AutoDisposeFutureProvider<IcarStop> {
  /// See also [icarStopDetail].
  IcarStopDetailProvider(IcarStop icarStop, Position userPosition)
    : this._internal(
        (ref) =>
            icarStopDetail(ref as IcarStopDetailRef, icarStop, userPosition),
        from: icarStopDetailProvider,
        name: r'icarStopDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarStopDetailHash,
        dependencies: IcarStopDetailFamily._dependencies,
        allTransitiveDependencies:
            IcarStopDetailFamily._allTransitiveDependencies,
        icarStop: icarStop,
        userPosition: userPosition,
      );

  IcarStopDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.icarStop,
    required this.userPosition,
  }) : super.internal();

  final IcarStop icarStop;
  final Position userPosition;

  @override
  Override overrideWith(
    FutureOr<IcarStop> Function(IcarStopDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IcarStopDetailProvider._internal(
        (ref) => create(ref as IcarStopDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        icarStop: icarStop,
        userPosition: userPosition,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IcarStop> createElement() {
    return _IcarStopDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarStopDetailProvider &&
        other.icarStop == icarStop &&
        other.userPosition == userPosition;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, icarStop.hashCode);
    hash = _SystemHash.combine(hash, userPosition.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IcarStopDetailRef on AutoDisposeFutureProviderRef<IcarStop> {
  /// The parameter `icarStop` of this provider.
  IcarStop get icarStop;

  /// The parameter `userPosition` of this provider.
  Position get userPosition;
}

class _IcarStopDetailProviderElement
    extends AutoDisposeFutureProviderElement<IcarStop>
    with IcarStopDetailRef {
  _IcarStopDetailProviderElement(super.provider);

  @override
  IcarStop get icarStop => (origin as IcarStopDetailProvider).icarStop;
  @override
  Position get userPosition => (origin as IcarStopDetailProvider).userPosition;
}

String _$icarListHash() => r'3218ea2eb27b180ff33b44da484e4c968b22decd';

/// See also [icarList].
@ProviderFor(icarList)
const icarListProvider = IcarListFamily();

/// See also [icarList].
class IcarListFamily extends Family<AsyncValue<List<Icar>>> {
  /// See also [icarList].
  const IcarListFamily();

  /// See also [icarList].
  IcarListProvider call(IcarStop icarStop) {
    return IcarListProvider(icarStop);
  }

  @override
  IcarListProvider getProviderOverride(covariant IcarListProvider provider) {
    return call(provider.icarStop);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'icarListProvider';
}

/// See also [icarList].
class IcarListProvider extends AutoDisposeFutureProvider<List<Icar>> {
  /// See also [icarList].
  IcarListProvider(IcarStop icarStop)
    : this._internal(
        (ref) => icarList(ref as IcarListRef, icarStop),
        from: icarListProvider,
        name: r'icarListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarListHash,
        dependencies: IcarListFamily._dependencies,
        allTransitiveDependencies: IcarListFamily._allTransitiveDependencies,
        icarStop: icarStop,
      );

  IcarListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.icarStop,
  }) : super.internal();

  final IcarStop icarStop;

  @override
  Override overrideWith(
    FutureOr<List<Icar>> Function(IcarListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IcarListProvider._internal(
        (ref) => create(ref as IcarListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        icarStop: icarStop,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Icar>> createElement() {
    return _IcarListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarListProvider && other.icarStop == icarStop;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, icarStop.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IcarListRef on AutoDisposeFutureProviderRef<List<Icar>> {
  /// The parameter `icarStop` of this provider.
  IcarStop get icarStop;
}

class _IcarListProviderElement
    extends AutoDisposeFutureProviderElement<List<Icar>>
    with IcarListRef {
  _IcarListProviderElement(super.provider);

  @override
  IcarStop get icarStop => (origin as IcarListProvider).icarStop;
}

String _$routeStateListHash() => r'c3633f3b42ff7412c2bc756ec6e2cca2ecbef00b';

/// See also [RouteStateList].
@ProviderFor(RouteStateList)
final routeStateListProvider =
    AutoDisposeAsyncNotifierProvider<RouteStateList, List<RouteState>>.internal(
      RouteStateList.new,
      name: r'routeStateListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$routeStateListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RouteStateList = AutoDisposeAsyncNotifier<List<RouteState>>;
String _$flutterMapControllerHash() =>
    r'd33904a74529e9caea2d64e3ed0f45813c6985ed';

/// See also [FlutterMapController].
@ProviderFor(FlutterMapController)
final flutterMapControllerProvider =
    AutoDisposeNotifierProvider<FlutterMapController, MapController?>.internal(
      FlutterMapController.new,
      name: r'flutterMapControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$flutterMapControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FlutterMapController = AutoDisposeNotifier<MapController?>;
String _$isShowingDetailHash() => r'1e8f3344994be6fdefd09251a396dccfcc3eb6d4';

/// See also [IsShowingDetail].
@ProviderFor(IsShowingDetail)
final isShowingDetailProvider =
    AutoDisposeNotifierProvider<IsShowingDetail, bool>.internal(
      IsShowingDetail.new,
      name: r'isShowingDetailProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$isShowingDetailHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$IsShowingDetail = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
