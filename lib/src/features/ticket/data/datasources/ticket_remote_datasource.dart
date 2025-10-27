import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:icar/src/core/errors/exception.dart';
import 'package:icar/src/features/ticket/data/models/review_model.dart';
import 'package:icar/src/features/ticket/data/models/ticket_model.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/utils/networks/body_builder.dart';
import 'package:icar/src/utils/networks/headers_builder.dart';
import 'package:icar/src/utils/networks/response_handler.dart';
import 'package:icar/src/utils/networks/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_remote_datasource.g.dart';

@riverpod
TicketRemoteDatasource ticketRemoteDatasource(Ref ref) {
  return TicketRemoteDatasource();
}

class TicketRemoteDatasource {
  Future<List<TicketModel>> getTickets(
    String token, {
    TicketStatus? status,
    int? limit,
    int? cursor,
  }) async {
    final response = await http.get(
      uriBuilder(
        endpoint: "/api/tickets",
        queryParameters: {
          "status": status?.name,
          "limit": limit,
          "cursor": cursor,
        },
      ),
      headers: headersBuilder(token: token),
    );

    return responseHandler<List<TicketModel>>(
      response,
      onSuccess: (serverResponse) {
        final ticketList =
            (serverResponse.data as List)
                .map((ticket) => TicketModel.fromJson(ticket))
                .toList();
        return ticketList;
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }

  Future<TicketModel> getTicketById(String token, int ticketId) async {
    final response = await http.get(
      uriBuilder(endpoint: "/api/tickets/$ticketId"),
      headers: headersBuilder(token: token),
    );

    return responseHandler<TicketModel>(
      response,
      onSuccess: (serverResponse) => TicketModel.fromJson(serverResponse.data),
      onError: (json) => throw ServerException.fromJson(json),
    );
  }

  Future<(TicketModel, String)> createTicket(
    String token,
    int scheduleId,
  ) async {
    final response = await http.post(
      uriBuilder(endpoint: "/api/tickets/create"),
      headers: headersBuilder(token: token),
      body: bodyBuilder({"scheduleId": scheduleId}),
    );

    return responseHandler<(TicketModel, String)>(
      response,
      onSuccess: (serverResponse) {
        return (
          TicketModel.fromJson(serverResponse.data),
          serverResponse.message!,
        );
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }

  Future<(TicketModel, String)> updateTicket(
    String token,
    int ticketId, {
    ReviewModel? newReview,
    TicketStatus? newStatus,
  }) async {
    final response = await http.patch(
      uriBuilder(endpoint: "/api/tickets/$ticketId"),
      headers: headersBuilder(token: token),
      body: bodyBuilder({
        "review": newReview?.toJson(),
        "status": newStatus?.name,
      }),
    );

    return responseHandler<(TicketModel, String)>(
      response,
      onSuccess: (serverResponse) {
        return (
          TicketModel.fromJson(serverResponse.data),
          serverResponse.message!,
        );
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }
}
