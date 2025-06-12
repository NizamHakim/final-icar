// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_queue_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketListByStatusHash() =>
    r'e77c1b4e67a17935991103dc47903c651a834c8b';

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

/// See also [ticketListByStatus].
@ProviderFor(ticketListByStatus)
const ticketListByStatusProvider = TicketListByStatusFamily();

/// See also [ticketListByStatus].
class TicketListByStatusFamily extends Family<AsyncValue<List<Ticket>>> {
  /// See also [ticketListByStatus].
  const TicketListByStatusFamily();

  /// See also [ticketListByStatus].
  TicketListByStatusProvider call(TicketStatus status) {
    return TicketListByStatusProvider(status);
  }

  @override
  TicketListByStatusProvider getProviderOverride(
    covariant TicketListByStatusProvider provider,
  ) {
    return call(provider.status);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ticketListByStatusProvider';
}

/// See also [ticketListByStatus].
class TicketListByStatusProvider
    extends AutoDisposeFutureProvider<List<Ticket>> {
  /// See also [ticketListByStatus].
  TicketListByStatusProvider(TicketStatus status)
    : this._internal(
        (ref) => ticketListByStatus(ref as TicketListByStatusRef, status),
        from: ticketListByStatusProvider,
        name: r'ticketListByStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$ticketListByStatusHash,
        dependencies: TicketListByStatusFamily._dependencies,
        allTransitiveDependencies:
            TicketListByStatusFamily._allTransitiveDependencies,
        status: status,
      );

  TicketListByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final TicketStatus status;

  @override
  Override overrideWith(
    FutureOr<List<Ticket>> Function(TicketListByStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TicketListByStatusProvider._internal(
        (ref) => create(ref as TicketListByStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Ticket>> createElement() {
    return _TicketListByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketListByStatusProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TicketListByStatusRef on AutoDisposeFutureProviderRef<List<Ticket>> {
  /// The parameter `status` of this provider.
  TicketStatus get status;
}

class _TicketListByStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<Ticket>>
    with TicketListByStatusRef {
  _TicketListByStatusProviderElement(super.provider);

  @override
  TicketStatus get status => (origin as TicketListByStatusProvider).status;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
