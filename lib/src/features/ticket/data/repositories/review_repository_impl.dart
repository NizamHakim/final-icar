import 'package:icar/src/features/ticket/data/datasources/review_local_datasource.dart';
import 'package:icar/src/features/ticket/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewLocalDatasource _reviewLocal;

  ReviewRepositoryImpl(this._reviewLocal);

  @override
  Map<int, List<String>> getReviewOptions() {
    return _reviewLocal.getReviewOptions();
  }
}
