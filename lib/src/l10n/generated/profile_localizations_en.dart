// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'profile_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ProfileLocalizationsEn extends ProfileLocalizations {
  ProfileLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get profileScreenTitle => 'Profile';

  @override
  String get language => 'Language';

  @override
  String get help => 'Help';

  @override
  String get logout => 'Logout';

  @override
  String languageTileLabel(String languageCode) {
    String _temp0 = intl.Intl.selectLogic(
      languageCode,
      {
        'en': 'English',
        'id': 'Bahasa Indonesia',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String switchLangDialogTitle(String languageCode) {
    String _temp0 = intl.Intl.selectLogic(
      languageCode,
      {
        'en': 'Switch language to English',
        'id': 'Switch language to Bahasa Indonesia',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get logoutDialogTitle => 'Logout';

  @override
  String get logoutDialogDesc => 'Are you sure you want to logout?';
}
