import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/ticket/ticket.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String token,
    required int id,
    required String name,
    required String email,
    required String password,
    List<Ticket>? tickets,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
