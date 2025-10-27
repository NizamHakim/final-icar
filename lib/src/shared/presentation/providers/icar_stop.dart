import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/location/presentation/providers/user_location.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/domain/repositories/icar_stop_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stop.g.dart';

@riverpod
Future<IcarStop> icarStop(Ref ref, int icarStopId) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final userPosition = await ref.watch(userLocationProvider.future);
  final icarStopRepository = ref.watch(icarStopRepositoryProvider);
  final stopEither = await icarStopRepository.getStopById(
    currentUser.token,
    userPosition,
    icarStopId,
  );

  return stopEither.fold(
    (failure) {
      throw failure;
    },
    (icarStop) {
      return icarStop;
    },
  );
}

final fakeIcarStop = const IcarStop(
  id: 0,
  name: "Dummy Stop",
  coordinate: LatLng(0, 0),
  distance: 0,
  duration: Duration(seconds: 0),
);
