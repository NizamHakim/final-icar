// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketDistanceResponse _$TicketDistanceResponseFromJson(
  Map<String, dynamic> json,
) => _TicketDistanceResponse(
  ticketId: (json['ticketId'] as num).toInt(),
  distanceStatus: $enumDecode(
    _$TicketDistanceStatusEnumMap,
    json['distanceStatus'],
  ),
);

Map<String, dynamic> _$TicketDistanceResponseToJson(
  _TicketDistanceResponse instance,
) => <String, dynamic>{
  'ticketId': instance.ticketId,
  'distanceStatus': _$TicketDistanceStatusEnumMap[instance.distanceStatus]!,
};

const _$TicketDistanceStatusEnumMap = {
  TicketDistanceStatus.NOTHING: 'NOTHING',
  TicketDistanceStatus.CLOSE: 'CLOSE',
  TicketDistanceStatus.ARRIVED: 'ARRIVED',
};

_ReviewOptionsResponse _$ReviewOptionsResponseFromJson(
  Map<String, dynamic> json,
) => _ReviewOptionsResponse(
  reviewOptions: (json['reviewOptions'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      int.parse(k),
      (e as List<dynamic>).map((e) => e as String).toList(),
    ),
  ),
);

Map<String, dynamic> _$ReviewOptionsResponseToJson(
  _ReviewOptionsResponse instance,
) => <String, dynamic>{
  'reviewOptions': instance.reviewOptions.map(
    (k, e) => MapEntry(k.toString(), e),
  ),
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketRepositoryHash() => r'be61ada814dd2affb10cf538ee143389eb8c9085';

/// See also [ticketRepository].
@ProviderFor(ticketRepository)
final ticketRepositoryProvider = AutoDisposeProvider<TicketRepository>.internal(
  ticketRepository,
  name: r'ticketRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$ticketRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TicketRepositoryRef = AutoDisposeProviderRef<TicketRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
