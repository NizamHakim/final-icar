// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_details_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketDetailsHash() => r'65c68faa7627af6fd361ef7b7d013c071e9d3048';

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

/// See also [ticketDetails].
@ProviderFor(ticketDetails)
const ticketDetailsProvider = TicketDetailsFamily();

/// See also [ticketDetails].
class TicketDetailsFamily extends Family<AsyncValue<Ticket>> {
  /// See also [ticketDetails].
  const TicketDetailsFamily();

  /// See also [ticketDetails].
  TicketDetailsProvider call({required Ticket ticket}) {
    return TicketDetailsProvider(ticket: ticket);
  }

  @override
  TicketDetailsProvider getProviderOverride(
    covariant TicketDetailsProvider provider,
  ) {
    return call(ticket: provider.ticket);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ticketDetailsProvider';
}

/// See also [ticketDetails].
class TicketDetailsProvider extends AutoDisposeFutureProvider<Ticket> {
  /// See also [ticketDetails].
  TicketDetailsProvider({required Ticket ticket})
    : this._internal(
        (ref) => ticketDetails(ref as TicketDetailsRef, ticket: ticket),
        from: ticketDetailsProvider,
        name: r'ticketDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$ticketDetailsHash,
        dependencies: TicketDetailsFamily._dependencies,
        allTransitiveDependencies:
            TicketDetailsFamily._allTransitiveDependencies,
        ticket: ticket,
      );

  TicketDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ticket,
  }) : super.internal();

  final Ticket ticket;

  @override
  Override overrideWith(
    FutureOr<Ticket> Function(TicketDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TicketDetailsProvider._internal(
        (ref) => create(ref as TicketDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ticket: ticket,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Ticket> createElement() {
    return _TicketDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailsProvider && other.ticket == ticket;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ticket.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TicketDetailsRef on AutoDisposeFutureProviderRef<Ticket> {
  /// The parameter `ticket` of this provider.
  Ticket get ticket;
}

class _TicketDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Ticket>
    with TicketDetailsRef {
  _TicketDetailsProviderElement(super.provider);

  @override
  Ticket get ticket => (origin as TicketDetailsProvider).ticket;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
