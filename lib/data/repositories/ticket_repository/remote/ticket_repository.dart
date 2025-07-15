import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/review/review.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/response/ticket_distance_response.dart';
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/core/exceptions/app_failure.dart';

part 'ticket_repository.g.dart';

@riverpod
TicketRepository ticketRepository(Ref ref) {
  return TicketRepository(ref);
}

class TicketRepository {
  final Ref ref;
  const TicketRepository(this.ref);

  Future<Either<AppFailure, Ticket?>> getClosestTicket() async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/tickets/closest"),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, Ticket?>(
        response,
        onSuccess: (json) {
          return response.body == "null" ? null : Ticket.fromJson(json);
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, List<Ticket>>> getTicketsByStatus(
    TicketStatus status,
  ) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(
          endpoint: "/api/tickets",
          queryParameters: {"status": status.name},
        ),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, List<Ticket>>(
        response,
        onSuccess: (json) {
          return (json as List)
              .map((ticket) => Ticket.fromJson(ticket))
              .toList();
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> getTicketDetails(int ticketId) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/tickets/$ticketId"),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, Ticket>(
        response,
        onSuccess: (json) => Ticket.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> createNewTicket(int scheduleId) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.post(
        uriBuilder(endpoint: "/api/tickets/create"),
        headers: getHeaders(token: currentUser.token),
        body: jsonEncode({"scheduleId": scheduleId}),
      );

      return handleResponse<AppFailure, Ticket>(
        response,
        onSuccess: (json) => Ticket.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> cancelTicket(int ticketId) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.patch(
        uriBuilder(endpoint: "/api/tickets/$ticketId"),
        headers: getHeaders(token: currentUser.token),
        body: jsonEncode({"status": TicketStatus.CANCELED.name}),
      );

      return handleResponse<AppFailure, Ticket>(
        response,
        onSuccess: (json) => Ticket.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, Ticket>> updateReview(
    int ticketId,
    Review review,
  ) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.patch(
        uriBuilder(endpoint: "/api/tickets/$ticketId"),
        headers: getHeaders(token: currentUser.token),
        body: jsonEncode({"review": review.toJson()}),
      );

      return handleResponse<AppFailure, Ticket>(
        response,
        onSuccess: (json) => Ticket.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, List<TicketDistanceResponse>>>
  getTicketsDistanceStatus(Position icarPosition, int icarId) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/tickets/distance"),
        headers: getHeaders(
          token: currentUser.token,
          icarPosition: icarPosition,
          icarId: icarId,
        ),
      );

      return handleResponse<AppFailure, List<TicketDistanceResponse>>(
        response,
        onSuccess: (json) {
          return (json as List)
              .map(
                (ticketDistance) =>
                    TicketDistanceResponse.fromJson(ticketDistance),
              )
              .toList();
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
