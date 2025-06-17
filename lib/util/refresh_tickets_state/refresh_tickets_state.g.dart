// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_tickets_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refreshTicketsStateHash() =>
    r'99997ba19e1f4f4525bd48c88ca37e5d40edd5c1';

/// See also [refreshTicketsState].
@ProviderFor(refreshTicketsState)
final refreshTicketsStateProvider = AutoDisposeProvider<void>.internal(
  refreshTicketsState,
  name: r'refreshTicketsStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$refreshTicketsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RefreshTicketsStateRef = AutoDisposeProviderRef<void>;
String _$refreshTicketByIdHash() => r'af66ecb71276d3c4e0d5068602880b17a5b23232';

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

/// See also [refreshTicketById].
@ProviderFor(refreshTicketById)
const refreshTicketByIdProvider = RefreshTicketByIdFamily();

/// See also [refreshTicketById].
class RefreshTicketByIdFamily extends Family<void> {
  /// See also [refreshTicketById].
  const RefreshTicketByIdFamily();

  /// See also [refreshTicketById].
  RefreshTicketByIdProvider call(int ticketId) {
    return RefreshTicketByIdProvider(ticketId);
  }

  @override
  RefreshTicketByIdProvider getProviderOverride(
    covariant RefreshTicketByIdProvider provider,
  ) {
    return call(provider.ticketId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'refreshTicketByIdProvider';
}

/// See also [refreshTicketById].
class RefreshTicketByIdProvider extends AutoDisposeProvider<void> {
  /// See also [refreshTicketById].
  RefreshTicketByIdProvider(int ticketId)
    : this._internal(
        (ref) => refreshTicketById(ref as RefreshTicketByIdRef, ticketId),
        from: refreshTicketByIdProvider,
        name: r'refreshTicketByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$refreshTicketByIdHash,
        dependencies: RefreshTicketByIdFamily._dependencies,
        allTransitiveDependencies:
            RefreshTicketByIdFamily._allTransitiveDependencies,
        ticketId: ticketId,
      );

  RefreshTicketByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ticketId,
  }) : super.internal();

  final int ticketId;

  @override
  Override overrideWith(void Function(RefreshTicketByIdRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: RefreshTicketByIdProvider._internal(
        (ref) => create(ref as RefreshTicketByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ticketId: ticketId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _RefreshTicketByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefreshTicketByIdProvider && other.ticketId == ticketId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ticketId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefreshTicketByIdRef on AutoDisposeProviderRef<void> {
  /// The parameter `ticketId` of this provider.
  int get ticketId;
}

class _RefreshTicketByIdProviderElement extends AutoDisposeProviderElement<void>
    with RefreshTicketByIdRef {
  _RefreshTicketByIdProviderElement(super.provider);

  @override
  int get ticketId => (origin as RefreshTicketByIdProvider).ticketId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
