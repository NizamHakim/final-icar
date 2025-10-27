// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class OnboardingLocalizationsEn extends OnboardingLocalizations {
  OnboardingLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String onboardingTitle(String index) {
    String _temp0 = intl.Intl.selectLogic(
      index,
      {
        '1': 'Join queue with the app',
        '2': 'iCar tracking',
        '3': 'Go to the stop',
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
        '1': 'Travel around ITS with iCar and monitor queues through the app',
        '2': 'Track iCar position and get ready for your ride',
        '3': 'Go to the stop when your ride is nearby',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get skip => 'Skip';
}
