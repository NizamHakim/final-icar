import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  late AuthRepository authRepository;

  @override
  Future<User?> build() async {
    authRepository = ref.watch(authRepositoryProvider);
    final userEither = await authRepository.getAuthenticatedUserData();
    return userEither.fold((failure) => null, (user) => user);
  }

  void setUser(User? user) {
    state = AsyncData(user);
  }
}

final fakeUser = const User(
  token:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImVtYWlsIjoiZW1haWxAZ21haWwuY29tIiwiaWF0IjoxNzYwNzQ2MzQ2fQ.bNvx2lCYIATSAaFGpHmvFF-4I-MfYIAKgjTi-x1Ced0",
  id: 2,
  name: "Dummy",
  email: "email@gmail.com",
);
