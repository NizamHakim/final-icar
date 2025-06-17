// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_index.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bottomNavIndexHash() => r'3a80a760fab1a030ba353daec01581cc7f41625b';

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

abstract class _$BottomNavIndex extends BuildlessAutoDisposeNotifier<int> {
  late final int initial;

  int build(int initial);
}

/// See also [BottomNavIndex].
@ProviderFor(BottomNavIndex)
const bottomNavIndexProvider = BottomNavIndexFamily();

/// See also [BottomNavIndex].
class BottomNavIndexFamily extends Family<int> {
  /// See also [BottomNavIndex].
  const BottomNavIndexFamily();

  /// See also [BottomNavIndex].
  BottomNavIndexProvider call(int initial) {
    return BottomNavIndexProvider(initial);
  }

  @override
  BottomNavIndexProvider getProviderOverride(
    covariant BottomNavIndexProvider provider,
  ) {
    return call(provider.initial);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bottomNavIndexProvider';
}

/// See also [BottomNavIndex].
class BottomNavIndexProvider
    extends AutoDisposeNotifierProviderImpl<BottomNavIndex, int> {
  /// See also [BottomNavIndex].
  BottomNavIndexProvider(int initial)
    : this._internal(
        () => BottomNavIndex()..initial = initial,
        from: bottomNavIndexProvider,
        name: r'bottomNavIndexProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$bottomNavIndexHash,
        dependencies: BottomNavIndexFamily._dependencies,
        allTransitiveDependencies:
            BottomNavIndexFamily._allTransitiveDependencies,
        initial: initial,
      );

  BottomNavIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initial,
  }) : super.internal();

  final int initial;

  @override
  int runNotifierBuild(covariant BottomNavIndex notifier) {
    return notifier.build(initial);
  }

  @override
  Override overrideWith(BottomNavIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: BottomNavIndexProvider._internal(
        () => create()..initial = initial,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initial: initial,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BottomNavIndex, int> createElement() {
    return _BottomNavIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BottomNavIndexProvider && other.initial == initial;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initial.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BottomNavIndexRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `initial` of this provider.
  int get initial;
}

class _BottomNavIndexProviderElement
    extends AutoDisposeNotifierProviderElement<BottomNavIndex, int>
    with BottomNavIndexRef {
  _BottomNavIndexProviderElement(super.provider);

  @override
  int get initial => (origin as BottomNavIndexProvider).initial;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
