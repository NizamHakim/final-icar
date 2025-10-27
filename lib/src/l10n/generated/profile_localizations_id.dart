// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'profile_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class ProfileLocalizationsId extends ProfileLocalizations {
  ProfileLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get profileScreenTitle => 'Profil';

  @override
  String get language => 'Bahasa';

  @override
  String get help => 'Pusat bantuan';

  @override
  String get logout => 'Keluar';

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
        'en': 'Ganti bahasa ke English',
        'id': 'Ganti bahasa ke Bahasa Indonesia',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get logoutDialogTitle => 'Keluar';

  @override
  String get logoutDialogDesc => 'Apakah kamu yakin ingin keluar?';
}
