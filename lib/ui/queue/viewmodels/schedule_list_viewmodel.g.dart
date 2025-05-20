// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleListHash() => r'd8a19a6091e1cf4effdb1fe000759022a0be34f4';

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

/// See also [scheduleList].
@ProviderFor(scheduleList)
const scheduleListProvider = ScheduleListFamily();

/// See also [scheduleList].
class ScheduleListFamily extends Family<AsyncValue<List<Schedule>>> {
  /// See also [scheduleList].
  const ScheduleListFamily();

  /// See also [scheduleList].
  ScheduleListProvider call({
    required IcarStop icarStop,
    required IcarRoute icarRoute,
  }) {
    return ScheduleListProvider(icarStop: icarStop, icarRoute: icarRoute);
  }

  @override
  ScheduleListProvider getProviderOverride(
    covariant ScheduleListProvider provider,
  ) {
    return call(icarStop: provider.icarStop, icarRoute: provider.icarRoute);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scheduleListProvider';
}

/// See also [scheduleList].
class ScheduleListProvider extends AutoDisposeFutureProvider<List<Schedule>> {
  /// See also [scheduleList].
  ScheduleListProvider({
    required IcarStop icarStop,
    required IcarRoute icarRoute,
  }) : this._internal(
         (ref) => scheduleList(
           ref as ScheduleListRef,
           icarStop: icarStop,
           icarRoute: icarRoute,
         ),
         from: scheduleListProvider,
         name: r'scheduleListProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$scheduleListHash,
         dependencies: ScheduleListFamily._dependencies,
         allTransitiveDependencies:
             ScheduleListFamily._allTransitiveDependencies,
         icarStop: icarStop,
         icarRoute: icarRoute,
       );

  ScheduleListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.icarStop,
    required this.icarRoute,
  }) : super.internal();

  final IcarStop icarStop;
  final IcarRoute icarRoute;

  @override
  Override overrideWith(
    FutureOr<List<Schedule>> Function(ScheduleListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleListProvider._internal(
        (ref) => create(ref as ScheduleListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        icarStop: icarStop,
        icarRoute: icarRoute,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Schedule>> createElement() {
    return _ScheduleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleListProvider &&
        other.icarStop == icarStop &&
        other.icarRoute == icarRoute;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, icarStop.hashCode);
    hash = _SystemHash.combine(hash, icarRoute.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ScheduleListRef on AutoDisposeFutureProviderRef<List<Schedule>> {
  /// The parameter `icarStop` of this provider.
  IcarStop get icarStop;

  /// The parameter `icarRoute` of this provider.
  IcarRoute get icarRoute;
}

class _ScheduleListProviderElement
    extends AutoDisposeFutureProviderElement<List<Schedule>>
    with ScheduleListRef {
  _ScheduleListProviderElement(super.provider);

  @override
  IcarStop get icarStop => (origin as ScheduleListProvider).icarStop;
  @override
  IcarRoute get icarRoute => (origin as ScheduleListProvider).icarRoute;
}

String _$createNewTicketHash() => r'2956f4e1dfc6d1389b89dee0210e6a3d8461a532';

/// See also [CreateNewTicket].
@ProviderFor(CreateNewTicket)
final createNewTicketProvider =
    AutoDisposeAsyncNotifierProvider<CreateNewTicket, Ticket?>.internal(
      CreateNewTicket.new,
      name: r'createNewTicketProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createNewTicketHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateNewTicket = AutoDisposeAsyncNotifier<Ticket?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
