// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarRouteHash() => r'2c264140c3afac6c1a20fe4cd3ce4fa05f8944c7';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
