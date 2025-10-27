import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_local_datasource.g.dart';

@riverpod
ReviewLocalDatasource reviewLocalDatasource(Ref ref) {
  return ReviewLocalDatasource();
}

class ReviewLocalDatasource {
  Map<int, List<String>> getReviewOptions() {
    return {
      1: [
        "PUNCTUALITY",
        "TRAVEL_SAFETY",
        "COMFORT",
        "CLEANLINESS",
        "TRAVEL_SPEED",
        "APPLICATION_SERVICE",
        "NUMBER_OF_SEATS",
        "TRAVEL_ROUTE",
        "NUMBER_OF_STOPS",
      ],
      2: [
        "PUNCTUALITY",
        "TRAVEL_SAFETY",
        "COMFORT",
        "CLEANLINESS",
        "TRAVEL_SPEED",
        "APPLICATION_SERVICE",
        "NUMBER_OF_SEATS",
        "TRAVEL_ROUTE",
        "NUMBER_OF_STOPS",
      ],
      3: [
        "PUNCTUALITY",
        "TRAVEL_SAFETY",
        "COMFORT",
        "CLEANLINESS",
        "TRAVEL_SPEED",
        "APPLICATION_SERVICE",
        "NUMBER_OF_SEATS",
        "TRAVEL_ROUTE",
        "NUMBER_OF_STOPS",
      ],
      4: [
        "PUNCTUALITY",
        "TRAVEL_SAFETY",
        "COMFORT",
        "CLEANLINESS",
        "TRAVEL_SPEED",
        "APPLICATION_SERVICE",
        "NUMBER_OF_SEATS",
        "TRAVEL_ROUTE",
        "NUMBER_OF_STOPS",
      ],
      5: [
        "PUNCTUALITY",
        "TRAVEL_SAFETY",
        "COMFORT",
        "CLEANLINESS",
        "APPLICATION_SERVICE",
      ],
    };
  }
}
