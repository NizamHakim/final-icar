// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dialog_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarStopDetailHash() => r'711ed2c78e0c1e561da1831a7aa3e64db9edb202';

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

String _$icarWithSchedulesListHash() =>
    r'0163f37e875a8cda0d2d263d89eb094b8ea0aa3e';

/// See also [icarWithSchedulesList].
@ProviderFor(icarWithSchedulesList)
const icarWithSchedulesListProvider = IcarWithSchedulesListFamily();

/// See also [icarWithSchedulesList].
class IcarWithSchedulesListFamily extends Family<AsyncValue<List<Icar>>> {
  /// See also [icarWithSchedulesList].
  const IcarWithSchedulesListFamily();

  /// See also [icarWithSchedulesList].
  IcarWithSchedulesListProvider call(IcarStop icarStop) {
    return IcarWithSchedulesListProvider(icarStop);
  }

  @override
  IcarWithSchedulesListProvider getProviderOverride(
    covariant IcarWithSchedulesListProvider provider,
  ) {
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
  String? get name => r'icarWithSchedulesListProvider';
}

/// See also [icarWithSchedulesList].
class IcarWithSchedulesListProvider
    extends AutoDisposeFutureProvider<List<Icar>> {
  /// See also [icarWithSchedulesList].
  IcarWithSchedulesListProvider(IcarStop icarStop)
    : this._internal(
        (ref) =>
            icarWithSchedulesList(ref as IcarWithSchedulesListRef, icarStop),
        from: icarWithSchedulesListProvider,
        name: r'icarWithSchedulesListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarWithSchedulesListHash,
        dependencies: IcarWithSchedulesListFamily._dependencies,
        allTransitiveDependencies:
            IcarWithSchedulesListFamily._allTransitiveDependencies,
        icarStop: icarStop,
      );

  IcarWithSchedulesListProvider._internal(
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
    FutureOr<List<Icar>> Function(IcarWithSchedulesListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IcarWithSchedulesListProvider._internal(
        (ref) => create(ref as IcarWithSchedulesListRef),
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
    return _IcarWithSchedulesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarWithSchedulesListProvider && other.icarStop == icarStop;
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
mixin IcarWithSchedulesListRef on AutoDisposeFutureProviderRef<List<Icar>> {
  /// The parameter `icarStop` of this provider.
  IcarStop get icarStop;
}

class _IcarWithSchedulesListProviderElement
    extends AutoDisposeFutureProviderElement<List<Icar>>
    with IcarWithSchedulesListRef {
  _IcarWithSchedulesListProviderElement(super.provider);

  @override
  IcarStop get icarStop => (origin as IcarWithSchedulesListProvider).icarStop;
}

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
