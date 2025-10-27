// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$schedulesListHash() => r'8010bd3d8f59f6a7f3ff15c27bed5b6473e233a5';

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

/// See also [schedulesList].
@ProviderFor(schedulesList)
const schedulesListProvider = SchedulesListFamily();

/// See also [schedulesList].
class SchedulesListFamily extends Family<AsyncValue<List<Schedule>>> {
  /// See also [schedulesList].
  const SchedulesListFamily();

  /// See also [schedulesList].
  SchedulesListProvider call({
    required int icarStopId,
    required int icarRouteId,
  }) {
    return SchedulesListProvider(
      icarStopId: icarStopId,
      icarRouteId: icarRouteId,
    );
  }

  @override
  SchedulesListProvider getProviderOverride(
    covariant SchedulesListProvider provider,
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
  String? get name => r'schedulesListProvider';
}

/// See also [schedulesList].
class SchedulesListProvider extends AutoDisposeFutureProvider<List<Schedule>> {
  /// See also [schedulesList].
  SchedulesListProvider({required int icarStopId, required int icarRouteId})
    : this._internal(
        (ref) => schedulesList(
          ref as SchedulesListRef,
          icarStopId: icarStopId,
          icarRouteId: icarRouteId,
        ),
        from: schedulesListProvider,
        name: r'schedulesListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$schedulesListHash,
        dependencies: SchedulesListFamily._dependencies,
        allTransitiveDependencies:
            SchedulesListFamily._allTransitiveDependencies,
        icarStopId: icarStopId,
        icarRouteId: icarRouteId,
      );

  SchedulesListProvider._internal(
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
    FutureOr<List<Schedule>> Function(SchedulesListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SchedulesListProvider._internal(
        (ref) => create(ref as SchedulesListRef),
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
    return _SchedulesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SchedulesListProvider &&
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
mixin SchedulesListRef on AutoDisposeFutureProviderRef<List<Schedule>> {
  /// The parameter `icarStopId` of this provider.
  int get icarStopId;

  /// The parameter `icarRouteId` of this provider.
  int get icarRouteId;
}

class _SchedulesListProviderElement
    extends AutoDisposeFutureProviderElement<List<Schedule>>
    with SchedulesListRef {
  _SchedulesListProviderElement(super.provider);

  @override
  int get icarStopId => (origin as SchedulesListProvider).icarStopId;
  @override
  int get icarRouteId => (origin as SchedulesListProvider).icarRouteId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
