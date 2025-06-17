import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/ticket/review.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/util/app_dot_env.dart';
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
  Future<Either<AppFailure, Ticket?>> getClosestTicket(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/user/$userId/closest"),
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
    int userId,
    TicketStatus status,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${AppDotEnv.httpUrl}/api/tickets/user/$userId/status/${status.name}",
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

  Future<Either<AppFailure, Ticket>> getTicketDetails(int ticketId) async {
    try {
      final response = await http.get(
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/$ticketId"),
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
    int userId,
    int scheduleId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userId": userId, "scheduleId": scheduleId}),
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

  Future<Either<AppFailure, Ticket>> cancelTicket(int ticketId) async {
    try {
      final response = await http.post(
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/$ticketId/cancel"),
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
    int userId,
    PositionResponse icarPositionResponse,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/distance-status"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": userId,
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
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/review-options"),
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
    int ticketId,
    Review review,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${AppDotEnv.httpUrl}/api/tickets/$ticketId/review"),
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
