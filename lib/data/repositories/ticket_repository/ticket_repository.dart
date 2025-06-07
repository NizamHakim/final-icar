import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/exceptions/app_failure.dart';

part 'ticket_repository.g.dart';

@riverpod
TicketRepository ticketRepository(Ref ref) {
  return TicketRepository();
}

class TicketRepository {
  Future<Either<AppFailure, Ticket?>> getClosestTicket() async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.url}/api/tickets/user/1/closest"),
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
    TicketStatus status,
  ) async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.url}/api/tickets/user/1/status/${status.name}"),
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
        Uri.parse("${ServerConn.url}/api/tickets/${ticket.id}"),
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
        Uri.parse("${ServerConn.url}/api/tickets/create"),
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
}
