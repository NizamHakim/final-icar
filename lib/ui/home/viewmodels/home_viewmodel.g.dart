// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeListHash() => r'3010b98b18419472d4edc5c7e7dd2d0bffb115dc';

/// See also [routeList].
@ProviderFor(routeList)
final routeListProvider = AutoDisposeFutureProvider<List<IcarRoute>>.internal(
  routeList,
  name: r'routeListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routeListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RouteListRef = AutoDisposeFutureProviderRef<List<IcarRoute>>;
String _$closestTicketHash() => r'055f9a5ad7dc78e696bc698c349799913ab5ca0d';

/// See also [closestTicket].
@ProviderFor(closestTicket)
final closestTicketProvider = AutoDisposeFutureProvider<Ticket?>.internal(
  closestTicket,
  name: r'closestTicketProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$closestTicketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClosestTicketRef = AutoDisposeFutureProviderRef<Ticket?>;
String _$searchStopHash() => r'2c1e94c7b41e1c8795451e2a1bfe008bd1103f2e';

/// See also [SearchStop].
@ProviderFor(SearchStop)
final searchStopProvider =
    AutoDisposeNotifierProvider<SearchStop, String>.internal(
      SearchStop.new,
      name: r'searchStopProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$searchStopHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchStop = AutoDisposeNotifier<String>;
String _$icarStopStateListHash() => r'fd60e1eaa84db58324384e26e22b92d69c8eeb34';

/// See also [IcarStopStateList].
@ProviderFor(IcarStopStateList)
final icarStopStateListProvider = AutoDisposeAsyncNotifierProvider<
  IcarStopStateList,
  List<StopState>
>.internal(
  IcarStopStateList.new,
  name: r'icarStopStateListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$icarStopStateListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IcarStopStateList = AutoDisposeAsyncNotifier<List<StopState>>;
String _$selectedStopHash() => r'b853006e90150ec3258ecc5e5438e2fe613484fa';

/// See also [SelectedStop].
@ProviderFor(SelectedStop)
final selectedStopProvider =
    AutoDisposeNotifierProvider<SelectedStop, IcarStop?>.internal(
      SelectedStop.new,
      name: r'selectedStopProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedStopHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedStop = AutoDisposeNotifier<IcarStop?>;
String _$selectedRouteHash() => r'f27aa56034e1a25ddc43f77d9c35342c7a018b77';

/// See also [SelectedRoute].
@ProviderFor(SelectedRoute)
final selectedRouteProvider =
    AutoDisposeNotifierProvider<SelectedRoute, IcarRoute?>.internal(
      SelectedRoute.new,
      name: r'selectedRouteProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedRouteHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedRoute = AutoDisposeNotifier<IcarRoute?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
