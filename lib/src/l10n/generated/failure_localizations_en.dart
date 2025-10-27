// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'failure_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class FailureLocalizationsEn extends FailureLocalizations {
  FailureLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String failure(String failure) {
    String _temp0 = intl.Intl.selectLogic(
      failure,
      {
        'no_authentication_token': 'Token invalid, please login!',
        'logout_failed': 'Logout failed!',
        'other': 'Sorry, an unexpected error occured.\nPlease try again later.',
      },
    );
    return '$_temp0';
  }
}
