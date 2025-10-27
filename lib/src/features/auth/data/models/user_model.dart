import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/ticket/data/models/ticket_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String token,
    required int id,
    required String name,
    required String email,
    List<TicketModel>? tickets,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  User toEntity() {
    return User(
      token: token,
      id: id,
      name: name,
      email: email,
      tickets: tickets?.map((ticket) => ticket.toEntity()).toList(),
    );
  }
}
