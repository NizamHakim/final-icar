import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/settings_repository/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locales.g.dart';

@Riverpod(keepAlive: true)
class CurrentLocale extends _$CurrentLocale {
  @override
  Locale build() {
    final settingsRepository = ref.watch(settingsRepositoryProvider);
    final localeCode = settingsRepository.getLocale();

    if (localeCode == null) {
      settingsRepository.setLocale('en');
      return const Locale('en');
    } else {
      return Locale(localeCode);
    }
  }

  void setLocale(Locale locale) {
    state = locale;
    final settingsRepository = ref.read(settingsRepositoryProvider);
    settingsRepository.setLocale(locale.languageCode);
  }
}

@riverpod
List<AppLocale> supportedLocales(Ref ref) {
  return [
    AppLocale(text: 'English', locale: const Locale('en')),
    AppLocale(text: 'Bahasa Indonesia', locale: const Locale('id')),
  ];
}

class AppLocale {
  final String text;
  final Locale locale;

  AppLocale({required this.text, required this.locale});
}
