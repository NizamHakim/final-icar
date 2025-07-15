import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/data/repositories/auth_repository/local/auth_local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_viewmodel.g.dart';

@riverpod
Future<void> logout(Ref ref) async {
  final authLocalRepository = ref.read(authLocalRepositoryProvider);
  await authLocalRepository.clearToken();
  ref.read(currentUserProvider.notifier).setUser(null);
}
