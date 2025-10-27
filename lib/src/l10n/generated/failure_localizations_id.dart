// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'failure_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class FailureLocalizationsId extends FailureLocalizations {
  FailureLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String failure(String failure) {
    String _temp0 = intl.Intl.selectLogic(
      failure,
      {
        'no_authentication_token': 'Token tidak valid, silakan login!',
        'logout_failed': 'Logout gagal!',
        'other': 'Terjadi kesalahan pada sistem.\nSilakan coba lagi dalam beberapa saat.',
      },
    );
    return '$_temp0';
  }
}
