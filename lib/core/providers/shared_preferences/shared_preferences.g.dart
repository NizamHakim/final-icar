// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initializeSharedPreferencesHash() =>
    r'4c0a6c89e20c4a8d3918adf2dadba0afa012eaf5';

/// See also [initializeSharedPreferences].
@ProviderFor(initializeSharedPreferences)
final initializeSharedPreferencesProvider =
    AutoDisposeFutureProvider<void>.internal(
      initializeSharedPreferences,
      name: r'initializeSharedPreferencesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$initializeSharedPreferencesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InitializeSharedPreferencesRef = AutoDisposeFutureProviderRef<void>;
String _$sharedPreferencesInstanceHash() =>
    r'bcacbc9d5ae35de92e4b2032e53161dbd44d1c41';

/// See also [SharedPreferencesInstance].
@ProviderFor(SharedPreferencesInstance)
final sharedPreferencesInstanceProvider =
    NotifierProvider<SharedPreferencesInstance, SharedPreferences?>.internal(
      SharedPreferencesInstance.new,
      name: r'sharedPreferencesInstanceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$sharedPreferencesInstanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SharedPreferencesInstance = Notifier<SharedPreferences?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
