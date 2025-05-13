import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/schedule.dart';
import 'package:icar/data/models/ticket.dart';
import 'package:icar/data/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/app_failure.dart';

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

      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
      return Right(Ticket.fromMap(responseMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<Ticket>>> getTicketsByStatus(
    TicketStatus status,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${ServerConn.url}/api/tickets/user/1/status/${status.value}",
        ),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      final responseMap = jsonDecode(response.body) as List<dynamic>;
      List<Ticket> ticketList = [];

      for (final ticket in responseMap) {
        ticketList.add(Ticket.fromMap(ticket));
      }

      return Right(ticketList);
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

      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(Ticket.fromMap(responseMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
