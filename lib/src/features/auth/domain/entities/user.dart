import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String token,
    required int id,
    required String name,
    required String email,
    List<Ticket>? tickets,
  }) = _User;
}
