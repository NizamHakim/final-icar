// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'shared_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SharedLocalizationsEn extends SharedLocalizations {
  SharedLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Join Queue iCar ITS';

  @override
  String get stop => 'Stop';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get confirm => 'Confirm';

  @override
  String get submit => 'Submit';

  @override
  String get logout => 'Logout';

  @override
  String stopWithName(Object stopName) {
    return '$stopName Stop';
  }

  @override
  String minutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavMyQueue => 'My Queue';

  @override
  String get bottomNavProfile => 'Profile';
}
