import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_options_response.g.dart';
part 'review_options_response.freezed.dart';

@freezed
abstract class ReviewOptionsResponse with _$ReviewOptionsResponse {
  const factory ReviewOptionsResponse({
    required Map<int, List<String>> reviewOptions,
  }) = _ReviewOptionsResponse;

  factory ReviewOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewOptionsResponseFromJson(json);
}
