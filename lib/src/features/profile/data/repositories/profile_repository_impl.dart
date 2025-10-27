import 'package:flutter/material.dart';
import 'package:icar/src/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:icar/src/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileLocalDatasource _profileLocal;

  ProfileRepositoryImpl(this._profileLocal);

  @override
  Locale getLocale() {
    final languageCode = _profileLocal.getLocale() ?? "en";
    return Locale(languageCode, "ID");
  }

  @override
  Future<void> setLocale(Locale locale) async {
    await _profileLocal.setLocale(locale.languageCode);
  }
}
