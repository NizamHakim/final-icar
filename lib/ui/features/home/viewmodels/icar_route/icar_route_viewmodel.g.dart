// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_route_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarRoutesOptionsHash() => r'6cccc1310b735a1b96c9bd9d1f6573f170729053';

/// See also [icarRoutesOptions].
@ProviderFor(icarRoutesOptions)
final icarRoutesOptionsProvider =
    AutoDisposeFutureProvider<List<IcarRoute>>.internal(
      icarRoutesOptions,
      name: r'icarRoutesOptionsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$icarRoutesOptionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IcarRoutesOptionsRef = AutoDisposeFutureProviderRef<List<IcarRoute>>;
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
