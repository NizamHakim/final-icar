import 'package:icar/data/models/user.dart';
import 'package:icar/data/repositories/user_repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    return null;
  }

  void getUser() async {
    final userRepository = ref.watch(userRepositoryProvider);
    final data = await userRepository.getUserById(1);
    data.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (user) {
        state = user;
      },
    );
  }
}
