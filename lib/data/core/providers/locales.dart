import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locales.g.dart';

@Riverpod(keepAlive: true)
class CurrentLocale extends _$CurrentLocale {
  @override
  Locale? build() {
    return const Locale('en', 'EN');
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}

@riverpod
List<AppLocale> supportedLocales(Ref ref) {
  return [
    AppLocale(text: 'English', locale: const Locale('en', 'EN')),
    AppLocale(text: 'Bahasa Indonesia', locale: const Locale('id', 'ID')),
  ];
}

class AppLocale {
  final String text;
  final Locale locale;

  AppLocale({required this.text, required this.locale});
}
