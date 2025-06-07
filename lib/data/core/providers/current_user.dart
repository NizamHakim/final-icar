import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/shared_preferences/shared_preferences.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/data/repositories/auth_repository/auth_local_repository.dart';
import 'package:icar/data/repositories/auth_repository/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

// @Riverpod(keepAlive: true)
// class CurrentUser extends _$CurrentUser {
//   @override
//   User? build() {
//     return null;
//   }

//   void getUser() async {
//     final authLocalRepository = ref.watch(authLocalRepositoryProvider);
//     final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
//     // final token = authLocalRepository.getToken(sharedPreferences);
//     final token =
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImVtYWlsIjoiNTAyNTIxMTIwOUBzdHVkZW50Lml0cy5hYyIsImlhdCI6MTc0OTI4NDg2MH0.luGU7_gRSX4-ySQ0aDmlhr8OcEYlBcyjROmpgUGegco";

//     final authRemoteRepository = ref.watch(authRemoteRepositoryProvider);

//     if (token == null) return;
//     final userEither = await authRemoteRepository.getAuthorizedUserData(token);

//     userEither.fold(
//       (failure) {
//         throw Exception(failure.message);
//       },
//       (user) {
//         state = user;
//       },
//     );
//   }
// }

@Riverpod(keepAlive: true)
Future<User?> currentUser(Ref ref) async {
  final authLocalRepository = ref.watch(authLocalRepositoryProvider);
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  // final token = authLocalRepository.getToken(sharedPreferences);

  // if (token == null) return null;

  final authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImVtYWlsIjoiNTAyNTIxMTIwOUBzdHVkZW50Lml0cy5hYyIsImlhdCI6MTc0OTI4NDg2MH0.luGU7_gRSX4-ySQ0aDmlhr8OcEYlBcyjROmpgUGegco";
  final userEither = await authRemoteRepository.getAuthorizedUserData(token);

  return userEither.fold(
    (failure) => throw Exception(failure.message),
    (user) => user,
  );
}
