// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dialog_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarStopDetailHash() => r'2ad0366dd800f733e488c63aaac3021a54bfd5a3';

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
  IcarStopDetailProvider call(int icarStopId) {
    return IcarStopDetailProvider(icarStopId);
  }

  @override
  IcarStopDetailProvider getProviderOverride(
    covariant IcarStopDetailProvider provider,
  ) {
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
  String? get name => r'icarStopDetailProvider';
}

/// See also [icarStopDetail].
class IcarStopDetailProvider extends AutoDisposeFutureProvider<IcarStop> {
  /// See also [icarStopDetail].
  IcarStopDetailProvider(int icarStopId)
    : this._internal(
        (ref) => icarStopDetail(ref as IcarStopDetailRef, icarStopId),
        from: icarStopDetailProvider,
        name: r'icarStopDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarStopDetailHash,
        dependencies: IcarStopDetailFamily._dependencies,
        allTransitiveDependencies:
            IcarStopDetailFamily._allTransitiveDependencies,
        icarStopId: icarStopId,
      );

  IcarStopDetailProvider._internal(
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
        icarStopId: icarStopId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IcarStop> createElement() {
    return _IcarStopDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarStopDetailProvider && other.icarStopId == icarStopId;
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
mixin IcarStopDetailRef on AutoDisposeFutureProviderRef<IcarStop> {
  /// The parameter `icarStopId` of this provider.
  int get icarStopId;
}

class _IcarStopDetailProviderElement
    extends AutoDisposeFutureProviderElement<IcarStop>
    with IcarStopDetailRef {
  _IcarStopDetailProviderElement(super.provider);

  @override
  int get icarStopId => (origin as IcarStopDetailProvider).icarStopId;
}

String _$icarWithSchedulesListHash() =>
    r'1c4f8be167957ef9816f80d13b5f4e0c8230037c';

/// See also [icarWithSchedulesList].
@ProviderFor(icarWithSchedulesList)
const icarWithSchedulesListProvider = IcarWithSchedulesListFamily();

/// See also [icarWithSchedulesList].
class IcarWithSchedulesListFamily extends Family<AsyncValue<List<Icar>>> {
  /// See also [icarWithSchedulesList].
  const IcarWithSchedulesListFamily();

  /// See also [icarWithSchedulesList].
  IcarWithSchedulesListProvider call(int icarStopId) {
    return IcarWithSchedulesListProvider(icarStopId);
  }

  @override
  IcarWithSchedulesListProvider getProviderOverride(
    covariant IcarWithSchedulesListProvider provider,
  ) {
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
  String? get name => r'icarWithSchedulesListProvider';
}

/// See also [icarWithSchedulesList].
class IcarWithSchedulesListProvider
    extends AutoDisposeFutureProvider<List<Icar>> {
  /// See also [icarWithSchedulesList].
  IcarWithSchedulesListProvider(int icarStopId)
    : this._internal(
        (ref) =>
            icarWithSchedulesList(ref as IcarWithSchedulesListRef, icarStopId),
        from: icarWithSchedulesListProvider,
        name: r'icarWithSchedulesListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarWithSchedulesListHash,
        dependencies: IcarWithSchedulesListFamily._dependencies,
        allTransitiveDependencies:
            IcarWithSchedulesListFamily._allTransitiveDependencies,
        icarStopId: icarStopId,
      );

  IcarWithSchedulesListProvider._internal(
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
        icarStopId: icarStopId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Icar>> createElement() {
    return _IcarWithSchedulesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarWithSchedulesListProvider &&
        other.icarStopId == icarStopId;
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
mixin IcarWithSchedulesListRef on AutoDisposeFutureProviderRef<List<Icar>> {
  /// The parameter `icarStopId` of this provider.
  int get icarStopId;
}

class _IcarWithSchedulesListProviderElement
    extends AutoDisposeFutureProviderElement<List<Icar>>
    with IcarWithSchedulesListRef {
  _IcarWithSchedulesListProviderElement(super.provider);

  @override
  int get icarStopId => (origin as IcarWithSchedulesListProvider).icarStopId;
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
