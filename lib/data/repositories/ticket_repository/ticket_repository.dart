import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/ticket/review.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/exceptions/app_failure.dart';

part 'ticket_repository.g.dart';
part 'ticket_repository.freezed.dart';

@riverpod
TicketRepository ticketRepository(Ref ref) {
  return TicketRepository();
}

class TicketRepository {
  Future<Either<AppFailure, Ticket?>> getClosestTicket(User user) async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/user/${user.id}/closest"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      if (response.body == "null") {
        return const Right(null);
      }

      return Right(Ticket.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<Ticket>>> getTicketsByStatus(
    User user,
    TicketStatus status,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${ServerConn.httpUrl}/api/tickets/user/${user.id}/status/${status.name}",
        ),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      List<Ticket> ticketList = [];

      for (final ticket in jsonDecode(response.body) as List) {
        ticketList.add(Ticket.fromJson(ticket));
      }

      return Right(ticketList);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> getTicketDetails(Ticket ticket) async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/${ticket.id}"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(Ticket.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> createNewTicket(
    User user,
    Schedule schedule,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userId": user.id, "scheduleId": schedule.id}),
      );

      if (response.statusCode != 201) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(Ticket.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> cancelTicket(Ticket ticket) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/${ticket.id}/cancel"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(Ticket.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> finishTicket(Ticket ticket) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/${ticket.id}/finish"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(Ticket.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<TicketDistanceResponse>>>
  getTicketsDistanceStatus(
    User user,
    IcarPositionResponse icarPositionResponse,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/distance-status"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": user.id,
          "icarId": icarPositionResponse.icarId,
          "position": {
            "latitude": icarPositionResponse.position.latitude,
            "longitude": icarPositionResponse.position.longitude,
          },
        }),
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      List<TicketDistanceResponse> ticketDistanceResponseList = [];

      for (final ticketDistanceResponse in jsonDecode(response.body) as List) {
        ticketDistanceResponseList.add(
          TicketDistanceResponse.fromJson(ticketDistanceResponse),
        );
      }

      return Right(ticketDistanceResponseList);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, ReviewOptionsResponse>> getReviewOptions() async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/review-options"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(ReviewOptionsResponse.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> updateReview(
    Ticket ticket,
    Review review,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${ServerConn.httpUrl}/api/tickets/${ticket.id}/review"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(review.toJson()),
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(Ticket.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}

@freezed
abstract class TicketDistanceResponse with _$TicketDistanceResponse {
  const factory TicketDistanceResponse({
    required int ticketId,
    required TicketDistanceStatus distanceStatus,
  }) = _TicketDistanceResponse;

  factory TicketDistanceResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketDistanceResponseFromJson(json);
}

@freezed
abstract class ReviewOptionsResponse with _$ReviewOptionsResponse {
  const factory ReviewOptionsResponse({
    required Map<int, List<String>> reviewOptions,
  }) = _ReviewOptionsResponse;

  factory ReviewOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewOptionsResponseFromJson(json);
}
