import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.g.dart';
part 'app_failure.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const AppFailure._();

  const factory AppFailure({required String error}) = _AppFailure;

  factory AppFailure.fromJson(Map<String, dynamic> json) =>
      _$AppFailureFromJson(json);
}
