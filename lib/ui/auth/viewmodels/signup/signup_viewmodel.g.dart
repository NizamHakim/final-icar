// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupFormErrorsState _$SignupFormErrorsStateFromJson(
  Map<String, dynamic> json,
) => _SignupFormErrorsState(
  name: json['name'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  confirmPassword: json['confirmPassword'] as String?,
);

Map<String, dynamic> _$SignupFormErrorsStateToJson(
  _SignupFormErrorsState instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signupFormErrorHash() => r'daaab33263146d237f8d646969bb77b9b4b58b19';

/// See also [SignupFormError].
@ProviderFor(SignupFormError)
final signupFormErrorProvider = AutoDisposeNotifierProvider<
  SignupFormError,
  SignupFormErrorsState
>.internal(
  SignupFormError.new,
  name: r'signupFormErrorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$signupFormErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignupFormError = AutoDisposeNotifier<SignupFormErrorsState>;
String _$createNewUserHash() => r'08fb3ce11bcea878d9b856bf572c5dffaf389562';

/// See also [CreateNewUser].
@ProviderFor(CreateNewUser)
final createNewUserProvider =
    AutoDisposeAsyncNotifierProvider<CreateNewUser, User?>.internal(
      CreateNewUser.new,
      name: r'createNewUserProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createNewUserHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateNewUser = AutoDisposeAsyncNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
