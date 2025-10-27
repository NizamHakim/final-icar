// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icars_with_schedules.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarsWithSchedulesHash() =>
    r'98602bdf9ac1492620fcccb0a443259b1b856f5b';

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

/// See also [icarsWithSchedules].
@ProviderFor(icarsWithSchedules)
const icarsWithSchedulesProvider = IcarsWithSchedulesFamily();

/// See also [icarsWithSchedules].
class IcarsWithSchedulesFamily extends Family<AsyncValue<List<Icar>>> {
  /// See also [icarsWithSchedules].
  const IcarsWithSchedulesFamily();

  /// See also [icarsWithSchedules].
  IcarsWithSchedulesProvider call(int icarStopId) {
    return IcarsWithSchedulesProvider(icarStopId);
  }

  @override
  IcarsWithSchedulesProvider getProviderOverride(
    covariant IcarsWithSchedulesProvider provider,
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
  String? get name => r'icarsWithSchedulesProvider';
}

/// See also [icarsWithSchedules].
class IcarsWithSchedulesProvider extends AutoDisposeFutureProvider<List<Icar>> {
  /// See also [icarsWithSchedules].
  IcarsWithSchedulesProvider(int icarStopId)
    : this._internal(
        (ref) => icarsWithSchedules(ref as IcarsWithSchedulesRef, icarStopId),
        from: icarsWithSchedulesProvider,
        name: r'icarsWithSchedulesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$icarsWithSchedulesHash,
        dependencies: IcarsWithSchedulesFamily._dependencies,
        allTransitiveDependencies:
            IcarsWithSchedulesFamily._allTransitiveDependencies,
        icarStopId: icarStopId,
      );

  IcarsWithSchedulesProvider._internal(
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
    FutureOr<List<Icar>> Function(IcarsWithSchedulesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IcarsWithSchedulesProvider._internal(
        (ref) => create(ref as IcarsWithSchedulesRef),
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
    return _IcarsWithSchedulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IcarsWithSchedulesProvider &&
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
mixin IcarsWithSchedulesRef on AutoDisposeFutureProviderRef<List<Icar>> {
  /// The parameter `icarStopId` of this provider.
  int get icarStopId;
}

class _IcarsWithSchedulesProviderElement
    extends AutoDisposeFutureProviderElement<List<Icar>>
    with IcarsWithSchedulesRef {
  _IcarsWithSchedulesProviderElement(super.provider);

  @override
  int get icarStopId => (origin as IcarsWithSchedulesProvider).icarStopId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
