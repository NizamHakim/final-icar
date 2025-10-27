import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/location/presentation/providers/user_location.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/domain/repositories/icar_stop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stops.g.dart';

@riverpod
Future<List<IcarStop>> icarStops(Ref ref) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final userPosition = await ref.watch(userLocationProvider.future);
  final icarStopRepository = ref.watch(icarStopRepositoryProvider);

  final icarStopOptionsEither = await icarStopRepository.getStops(
    currentUser.token,
    userPosition,
  );

  return icarStopOptionsEither.fold(
    (failure) {
      throw failure;
    },
    (icarStopsOptions) {
      return icarStopsOptions;
    },
  );
}
