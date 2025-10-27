// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_stop.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarStopHash() => r'226e6174cd1b16e4bf133428a67293c8b8eae7cf';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
