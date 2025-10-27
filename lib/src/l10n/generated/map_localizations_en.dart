// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'map_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class MapLocalizationsEn extends MapLocalizations {
  MapLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mapScreenTitle => 'Track iCar';

  @override
  String get stopsForOneMinute => 'Stops for 1 minute';

  @override
  String get arrivalTime => 'Arrival Time';

  @override
  String session(String session) {
    String _temp0 = intl.Intl.selectLogic(
      session,
      {
        'SESSION_1': 'Session 1',
        'SESSION_2': 'Session 2',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }
}
