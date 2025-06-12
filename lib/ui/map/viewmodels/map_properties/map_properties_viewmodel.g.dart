// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_properties_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarStopListHash() => r'76e85c466fe3d0398903b8b10cbf29564da40f2c';

/// See also [icarStopList].
@ProviderFor(icarStopList)
final icarStopListProvider = AutoDisposeFutureProvider<List<IcarStop>>.internal(
  icarStopList,
  name: r'icarStopListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$icarStopListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IcarStopListRef = AutoDisposeFutureProviderRef<List<IcarStop>>;
String _$icarsPositionMapStreamHash() =>
    r'c2a8fd01f451b6a1d62fdae5dc5f389b3e0c8b1c';

/// See also [icarsPositionMapStream].
@ProviderFor(icarsPositionMapStream)
final icarsPositionMapStreamProvider =
    AutoDisposeStreamProvider<Map<int, LatLng>>.internal(
      icarsPositionMapStream,
      name: r'icarsPositionMapStreamProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$icarsPositionMapStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IcarsPositionMapStreamRef =
    AutoDisposeStreamProviderRef<Map<int, LatLng>>;
String _$routeStateListHash() => r'c3633f3b42ff7412c2bc756ec6e2cca2ecbef00b';

/// See also [RouteStateList].
@ProviderFor(RouteStateList)
final routeStateListProvider =
    AutoDisposeAsyncNotifierProvider<RouteStateList, List<RouteState>>.internal(
      RouteStateList.new,
      name: r'routeStateListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$routeStateListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RouteStateList = AutoDisposeAsyncNotifier<List<RouteState>>;
String _$flutterMapControllerHash() =>
    r'd33904a74529e9caea2d64e3ed0f45813c6985ed';

/// See also [FlutterMapController].
@ProviderFor(FlutterMapController)
final flutterMapControllerProvider =
    AutoDisposeNotifierProvider<FlutterMapController, MapController?>.internal(
      FlutterMapController.new,
      name: r'flutterMapControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$flutterMapControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FlutterMapController = AutoDisposeNotifier<MapController?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
