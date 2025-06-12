// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_history_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketHistoryHash() => r'5c2c659d55935711968afa084563f9c65324c082';

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

/// See also [ticketHistory].
@ProviderFor(ticketHistory)
const ticketHistoryProvider = TicketHistoryFamily();

/// See also [ticketHistory].
class TicketHistoryFamily extends Family<AsyncValue<Ticket>> {
  /// See also [ticketHistory].
  const TicketHistoryFamily();

  /// See also [ticketHistory].
  TicketHistoryProvider call({required Ticket ticket}) {
    return TicketHistoryProvider(ticket: ticket);
  }

  @override
  TicketHistoryProvider getProviderOverride(
    covariant TicketHistoryProvider provider,
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
  String? get name => r'ticketHistoryProvider';
}

/// See also [ticketHistory].
class TicketHistoryProvider extends AutoDisposeFutureProvider<Ticket> {
  /// See also [ticketHistory].
  TicketHistoryProvider({required Ticket ticket})
    : this._internal(
        (ref) => ticketHistory(ref as TicketHistoryRef, ticket: ticket),
        from: ticketHistoryProvider,
        name: r'ticketHistoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$ticketHistoryHash,
        dependencies: TicketHistoryFamily._dependencies,
        allTransitiveDependencies:
            TicketHistoryFamily._allTransitiveDependencies,
        ticket: ticket,
      );

  TicketHistoryProvider._internal(
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
    FutureOr<Ticket> Function(TicketHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TicketHistoryProvider._internal(
        (ref) => create(ref as TicketHistoryRef),
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
    return _TicketHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketHistoryProvider && other.ticket == ticket;
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
mixin TicketHistoryRef on AutoDisposeFutureProviderRef<Ticket> {
  /// The parameter `ticket` of this provider.
  Ticket get ticket;
}

class _TicketHistoryProviderElement
    extends AutoDisposeFutureProviderElement<Ticket>
    with TicketHistoryRef {
  _TicketHistoryProviderElement(super.provider);

  @override
  Ticket get ticket => (origin as TicketHistoryProvider).ticket;
}

String _$reviewSuggestionOptionsHash() =>
    r'7deaa8c95ab966079f15cd6018bedfb4c1fe9db0';

/// See also [reviewSuggestionOptions].
@ProviderFor(reviewSuggestionOptions)
final reviewSuggestionOptionsProvider =
    AutoDisposeFutureProvider<ReviewOptionsResponse>.internal(
      reviewSuggestionOptions,
      name: r'reviewSuggestionOptionsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$reviewSuggestionOptionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReviewSuggestionOptionsRef =
    AutoDisposeFutureProviderRef<ReviewOptionsResponse>;
String _$reviewOptionsHash() => r'fe08383b0071b61cfb61112930c6faccde238eef';

/// See also [reviewOptions].
@ProviderFor(reviewOptions)
final reviewOptionsProvider = AutoDisposeFutureProvider<List<String>>.internal(
  reviewOptions,
  name: r'reviewOptionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reviewOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReviewOptionsRef = AutoDisposeFutureProviderRef<List<String>>;
String _$ratingHash() => r'8dc9d7209b024bebaa0fa6309c7cf173cadbf2cc';

/// See also [Rating].
@ProviderFor(Rating)
final ratingProvider = AutoDisposeNotifierProvider<Rating, int>.internal(
  Rating.new,
  name: r'ratingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ratingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Rating = AutoDisposeNotifier<int>;
String _$isDoingReviewHash() => r'32a2bb2548a8659782520c164f97bb3a04a1e8ba';

/// See also [IsDoingReview].
@ProviderFor(IsDoingReview)
final isDoingReviewProvider =
    AutoDisposeNotifierProvider<IsDoingReview, bool>.internal(
      IsDoingReview.new,
      name: r'isDoingReviewProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$isDoingReviewHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$IsDoingReview = AutoDisposeNotifier<bool>;
String _$selectedReviewHash() => r'01a3ac9bfbcfd27953d0f08a03f90f00cd28daa5';

/// See also [SelectedReview].
@ProviderFor(SelectedReview)
final selectedReviewProvider =
    AutoDisposeNotifierProvider<SelectedReview, List<String>>.internal(
      SelectedReview.new,
      name: r'selectedReviewProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedReviewHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedReview = AutoDisposeNotifier<List<String>>;
String _$suggestionInputHash() => r'072158d69733db85a4608cf652f8005efdd3a67f';

/// See also [SuggestionInput].
@ProviderFor(SuggestionInput)
final suggestionInputProvider =
    AutoDisposeNotifierProvider<SuggestionInput, String>.internal(
      SuggestionInput.new,
      name: r'suggestionInputProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$suggestionInputHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SuggestionInput = AutoDisposeNotifier<String>;
String _$updateReviewHash() => r'c44250592908fecb74a7d64242b9bcbde84fd14d';

/// See also [UpdateReview].
@ProviderFor(UpdateReview)
final updateReviewProvider =
    AutoDisposeAsyncNotifierProvider<UpdateReview, Ticket?>.internal(
      UpdateReview.new,
      name: r'updateReviewProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$updateReviewHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UpdateReview = AutoDisposeAsyncNotifier<Ticket?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
