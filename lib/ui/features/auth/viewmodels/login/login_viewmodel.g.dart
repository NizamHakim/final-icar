// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginFormErrorsState _$LoginFormErrorsStateFromJson(
  Map<String, dynamic> json,
) => _LoginFormErrorsState(
  email: json['email'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$LoginFormErrorsStateToJson(
  _LoginFormErrorsState instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginFormErrorHash() => r'b2d2aa448a041e2aba6510b7ab115bb661c7acb3';

/// See also [LoginFormError].
@ProviderFor(LoginFormError)
final loginFormErrorProvider =
    AutoDisposeNotifierProvider<LoginFormError, LoginFormErrorsState>.internal(
      LoginFormError.new,
      name: r'loginFormErrorProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$loginFormErrorHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LoginFormError = AutoDisposeNotifier<LoginFormErrorsState>;
String _$userLoginHash() => r'85b6b6af6fc6e832e0f78308b65bd218b72ad00a';

/// See also [UserLogin].
@ProviderFor(UserLogin)
final userLoginProvider =
    AutoDisposeAsyncNotifierProvider<UserLogin, User?>.internal(
      UserLogin.new,
      name: r'userLoginProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$userLoginHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserLogin = AutoDisposeAsyncNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
