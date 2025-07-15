// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locales.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supportedLocalesHash() => r'965106cee36f92c4f72da42d08b4be63bd21dc8a';

/// See also [supportedLocales].
@ProviderFor(supportedLocales)
final supportedLocalesProvider = AutoDisposeProvider<List<AppLocale>>.internal(
  supportedLocales,
  name: r'supportedLocalesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$supportedLocalesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupportedLocalesRef = AutoDisposeProviderRef<List<AppLocale>>;
String _$currentLocaleHash() => r'ae9ed04edf6f2517ba25d7b3f84df468875f8476';

/// See also [CurrentLocale].
@ProviderFor(CurrentLocale)
final currentLocaleProvider = NotifierProvider<CurrentLocale, Locale>.internal(
  CurrentLocale.new,
  name: r'currentLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentLocale = Notifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
