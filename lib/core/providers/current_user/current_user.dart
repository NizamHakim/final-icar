import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/data/repositories/auth_repository/local/auth_local_repository.dart';
import 'package:icar/data/repositories/auth_repository/remote/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    return null;
  }

  void setUser(User? user) async {
    state = user;
  }
}

@riverpod
Future<void> initializeCurrentUser(Ref ref) async {
  final authLocalRepository = ref.watch(authLocalRepositoryProvider);
  final authRemoteRepository = ref.watch(authRemoteRepositoryProvider);

  final token = authLocalRepository.getToken();
  if (token != null) {
    final userEither = await authRemoteRepository.getAuthorizedUserData(token);
    userEither.fold(
      (failure) {
        authLocalRepository.clearToken();
        ref.read(currentUserProvider.notifier).setUser(null);
      },
      (user) {
        ref.read(currentUserProvider.notifier).setUser(user);
      },
    );
  } else {
    ref.read(currentUserProvider.notifier).setUser(null);
  }
}
