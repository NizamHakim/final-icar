import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/mapbox_repository/mapbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mapbox_token.g.dart';

@Riverpod(keepAlive: true)
Future<String> mapboxToken(Ref ref) async {
  final mapboxRepository = ref.watch(mapboxRepositoryProvider);
  final data = await mapboxRepository.getMapboxToken();
  return data.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (token) {
      return token;
    },
  );
}
