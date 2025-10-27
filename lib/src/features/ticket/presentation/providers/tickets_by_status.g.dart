// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_by_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketsByStatusHash() => r'f3b3116e39a8608def19d88b50a77ca61c41b677';

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

/// See also [ticketsByStatus].
@ProviderFor(ticketsByStatus)
const ticketsByStatusProvider = TicketsByStatusFamily();

/// See also [ticketsByStatus].
class TicketsByStatusFamily extends Family<AsyncValue<List<Ticket>>> {
  /// See also [ticketsByStatus].
  const TicketsByStatusFamily();

  /// See also [ticketsByStatus].
  TicketsByStatusProvider call(TicketStatus status) {
    return TicketsByStatusProvider(status);
  }

  @override
  TicketsByStatusProvider getProviderOverride(
    covariant TicketsByStatusProvider provider,
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
  String? get name => r'ticketsByStatusProvider';
}

/// See also [ticketsByStatus].
class TicketsByStatusProvider extends AutoDisposeFutureProvider<List<Ticket>> {
  /// See also [ticketsByStatus].
  TicketsByStatusProvider(TicketStatus status)
    : this._internal(
        (ref) => ticketsByStatus(ref as TicketsByStatusRef, status),
        from: ticketsByStatusProvider,
        name: r'ticketsByStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$ticketsByStatusHash,
        dependencies: TicketsByStatusFamily._dependencies,
        allTransitiveDependencies:
            TicketsByStatusFamily._allTransitiveDependencies,
        status: status,
      );

  TicketsByStatusProvider._internal(
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
    FutureOr<List<Ticket>> Function(TicketsByStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TicketsByStatusProvider._internal(
        (ref) => create(ref as TicketsByStatusRef),
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
    return _TicketsByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketsByStatusProvider && other.status == status;
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
mixin TicketsByStatusRef on AutoDisposeFutureProviderRef<List<Ticket>> {
  /// The parameter `status` of this provider.
  TicketStatus get status;
}

class _TicketsByStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<Ticket>>
    with TicketsByStatusRef {
  _TicketsByStatusProviderElement(super.provider);

  @override
  TicketStatus get status => (origin as TicketsByStatusProvider).status;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
