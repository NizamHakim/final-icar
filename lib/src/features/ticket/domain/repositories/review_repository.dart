import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/data/datasources/review_local_datasource.dart';
import 'package:icar/src/features/ticket/data/repositories/review_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_repository.g.dart';

@riverpod
ReviewRepository reviewRepository(Ref ref) {
  final reviewLocalDatasource = ref.watch(reviewLocalDatasourceProvider);
  return ReviewRepositoryImpl(reviewLocalDatasource);
}

abstract class ReviewRepository {
  Map<int, List<String>> getReviewOptions();
}
