import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/data/repositories/review_repository/responses/review_options_response.dart';
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/core/exceptions/app_failure.dart';

part 'review_repository.g.dart';

@riverpod
ReviewRepository reviewRepository(Ref ref) {
  return ReviewRepository(ref);
}

class ReviewRepository {
  final Ref ref;
  const ReviewRepository(this.ref);

  Future<Either<AppFailure, ReviewOptionsResponse>> getReviewOptions() async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/reviews/options"),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, ReviewOptionsResponse>(
        response,
        onSuccess: (json) => ReviewOptionsResponse.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
