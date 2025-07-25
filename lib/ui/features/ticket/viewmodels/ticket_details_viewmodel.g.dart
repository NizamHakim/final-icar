// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_details_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketDetailsHash() => r'772154eaf57e201e1a3776f4b3a780c4f2cbc9a9';

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
  TicketDetailsProvider call(int ticketId) {
    return TicketDetailsProvider(ticketId);
  }

  @override
  TicketDetailsProvider getProviderOverride(
    covariant TicketDetailsProvider provider,
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
  String? get name => r'ticketDetailsProvider';
}

/// See also [ticketDetails].
class TicketDetailsProvider extends AutoDisposeFutureProvider<Ticket> {
  /// See also [ticketDetails].
  TicketDetailsProvider(int ticketId)
    : this._internal(
        (ref) => ticketDetails(ref as TicketDetailsRef, ticketId),
        from: ticketDetailsProvider,
        name: r'ticketDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$ticketDetailsHash,
        dependencies: TicketDetailsFamily._dependencies,
        allTransitiveDependencies:
            TicketDetailsFamily._allTransitiveDependencies,
        ticketId: ticketId,
      );

  TicketDetailsProvider._internal(
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
        ticketId: ticketId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Ticket> createElement() {
    return _TicketDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailsProvider && other.ticketId == ticketId;
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
mixin TicketDetailsRef on AutoDisposeFutureProviderRef<Ticket> {
  /// The parameter `ticketId` of this provider.
  int get ticketId;
}

class _TicketDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Ticket>
    with TicketDetailsRef {
  _TicketDetailsProviderElement(super.provider);

  @override
  int get ticketId => (origin as TicketDetailsProvider).ticketId;
}

String _$cancelTicketHash() => r'ff7ed9063281a24a3842864efdbe16e28eba2d9f';

/// See also [CancelTicket].
@ProviderFor(CancelTicket)
final cancelTicketProvider =
    AutoDisposeAsyncNotifierProvider<CancelTicket, Ticket?>.internal(
      CancelTicket.new,
      name: r'cancelTicketProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$cancelTicketHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CancelTicket = AutoDisposeAsyncNotifier<Ticket?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
