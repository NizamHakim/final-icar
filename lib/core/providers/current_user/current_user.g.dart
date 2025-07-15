// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initializeCurrentUserHash() =>
    r'1c49b27f8a7a9bde1b2fcbdbd0cfa4b53b3d7ead';

/// See also [initializeCurrentUser].
@ProviderFor(initializeCurrentUser)
final initializeCurrentUserProvider = AutoDisposeFutureProvider<void>.internal(
  initializeCurrentUser,
  name: r'initializeCurrentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$initializeCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InitializeCurrentUserRef = AutoDisposeFutureProviderRef<void>;
String _$currentUserHash() => r'860a3769aaad2bd70936d6730ee75ac05fa70cce';

/// See also [CurrentUser].
@ProviderFor(CurrentUser)
final currentUserProvider = NotifierProvider<CurrentUser, User?>.internal(
  CurrentUser.new,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUser = Notifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
