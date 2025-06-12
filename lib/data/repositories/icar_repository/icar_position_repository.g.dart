// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_position_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarPositionResponse _$IcarPositionResponseFromJson(
  Map<String, dynamic> json,
) => _IcarPositionResponse(
  icarId: (json['icarId'] as num).toInt(),
  position: latLngFromJson(json['position'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IcarPositionResponseToJson(
  _IcarPositionResponse instance,
) => <String, dynamic>{
  'icarId': instance.icarId,
  'position': latLngToJson(instance.position),
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$icarPositionRepositoryHash() =>
    r'836bc70917733d2c190d352a0e8bc8a6e7ce3058';

/// See also [icarPositionRepository].
@ProviderFor(icarPositionRepository)
final icarPositionRepositoryProvider =
    AutoDisposeProvider<IcarPositionRepository>.internal(
      icarPositionRepository,
      name: r'icarPositionRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$icarPositionRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IcarPositionRepositoryRef =
    AutoDisposeProviderRef<IcarPositionRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
