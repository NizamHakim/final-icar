// import 'package:icar/data/models/user.dart';
// import 'package:icar/data/repositories/auth_repository/auth_remote_repository.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'login_viewmodel.g.dart';

// @riverpod
// class LoginViewmodel extends _$LoginViewmodel {
//   late AuthRemoteRepository _authRemoteRepository;

//   @override
//   AsyncValue<User>? build() {
//     _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
//     return null;
//   }

//   Future<void> loginUser({
//     required String email,
//     required String password,
//   }) async {
//     state = const AsyncValue.loading();
//     final res = await _authRemoteRepository.login(
//       email: email,
//       password: password,
//     );

//     res.fold(
//       (failure) {
//         state = AsyncError(failure.message, StackTrace.current);
//       },
//       (user) {
//         state = AsyncData(user);
//       },
//     );
//   }
// }
