// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class HomeLocalizationsEn extends HomeLocalizations {
  HomeLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String checkQueueLabel(String label) {
    String _temp0 = intl.Intl.selectLogic(
      label,
      {
        'stop': 'Stop',
        'route': 'Route',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String checkQueueHint(String hint) {
    String _temp0 = intl.Intl.selectLogic(
      hint,
      {
        'stop': 'Select a stop',
        'route': 'Select a route',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get checkQueueSubmitButton => 'Check iCar queue';

  @override
  String selectStopLabel(String label) {
    String _temp0 = intl.Intl.selectLogic(
      label,
      {
        'latest_search': 'Latest search',
        'all_options': 'Stops',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get selectStopFindStopHint => 'Find a stop...';

  @override
  String get selectStopNoStopMatched => 'No suitable stops matched';

  @override
  String get noUpcomingTicket => 'No upcoming ticket in queue';

  @override
  String get viewAll => 'View all';
}
