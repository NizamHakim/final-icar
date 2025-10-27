import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:icar/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  final profileLocalDatasource = ref.watch(profileLocalDatasourceProvider);
  return ProfileRepositoryImpl(profileLocalDatasource);
}

abstract class ProfileRepository {
  Locale getLocale();

  Future<void> setLocale(Locale locale);
}
