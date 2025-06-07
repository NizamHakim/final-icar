// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locales.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supportedLocalesHash() => r'ca2545a3f3db8aa5ddfc28ef04ef99409f7d9ffa';

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
String _$currentLocaleHash() => r'94c1e7dfd1775b959df98358584a6ef7047e2844';

/// See also [CurrentLocale].
@ProviderFor(CurrentLocale)
final currentLocaleProvider = NotifierProvider<CurrentLocale, Locale?>.internal(
  CurrentLocale.new,
  name: r'currentLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentLocale = Notifier<Locale?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
