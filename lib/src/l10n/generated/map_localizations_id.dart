// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'map_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class MapLocalizationsId extends MapLocalizations {
  MapLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get mapScreenTitle => 'Lacak iCar';

  @override
  String get stopsForOneMinute => 'Berhenti 1 menit';

  @override
  String get arrivalTime => 'Jadwal Tiba';

  @override
  String session(String session) {
    String _temp0 = intl.Intl.selectLogic(
      session,
      {
        'SESSION_1': 'Sesi 1',
        'SESSION_2': 'Sesi 2',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }
}
