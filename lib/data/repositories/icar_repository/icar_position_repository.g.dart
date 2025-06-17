// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_position_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionResponse _$PositionResponseFromJson(Map<String, dynamic> json) =>
    PositionResponse(
      type: $enumDecode(_$IcarWebSocketResponseTypeEnumMap, json['type']),
      icarId: (json['icarId'] as num).toInt(),
      position: positionFromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PositionResponseToJson(PositionResponse instance) =>
    <String, dynamic>{
      'type': _$IcarWebSocketResponseTypeEnumMap[instance.type]!,
      'icarId': instance.icarId,
      'position': positionToJson(instance.position),
    };

const _$IcarWebSocketResponseTypeEnumMap = {
  IcarWebSocketResponseType.position: 'position',
  IcarWebSocketResponseType.disconnected: 'disconnected',
};

DisconnectedResponse _$DisconnectedResponseFromJson(
  Map<String, dynamic> json,
) => DisconnectedResponse(
  type: $enumDecode(_$IcarWebSocketResponseTypeEnumMap, json['type']),
  icar: Icar.fromJson(json['icar'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DisconnectedResponseToJson(
  DisconnectedResponse instance,
) => <String, dynamic>{
  'type': _$IcarWebSocketResponseTypeEnumMap[instance.type]!,
  'icar': instance.icar,
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
