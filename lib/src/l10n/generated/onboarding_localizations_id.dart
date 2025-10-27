// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class OnboardingLocalizationsId extends OnboardingLocalizations {
  OnboardingLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String onboardingTitle(String index) {
    String _temp0 = intl.Intl.selectLogic(
      index,
      {
        '1': 'Antre pakai Aplikasi',
        '2': 'Lacak iCar',
        '3': 'Pergi ke Halte',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String onboardingDescription(String index) {
    String _temp0 = intl.Intl.selectLogic(
      index,
      {
        '1': 'Keliling ITS dengan iCar dan lihat antrean pakai aplikasi',
        '2': 'Lacak posisi iCar dan bersiap untuk perjalanan',
        '3': 'Pergi ke Halte',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get skip => 'Skip';
}
