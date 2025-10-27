import 'dart:ui';

import 'package:icar/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_locale.g.dart';

@Riverpod(keepAlive: true)
class CurrentLocale extends _$CurrentLocale {
  late ProfileRepository profileRepository;

  @override
  Locale build() {
    profileRepository = ref.watch(profileRepositoryProvider);
    return profileRepository.getLocale();
  }

  void setLocale(Locale locale) {
    state = locale;
    profileRepository.setLocale(locale);
  }
}
