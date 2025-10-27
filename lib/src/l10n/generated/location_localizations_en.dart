// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'location_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LocationLocalizationsEn extends LocationLocalizations {
  LocationLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get locationPermissionError => 'Location permission has not been granted.';

  @override
  String get locationServiceError => 'Location service has not been enabled.';

  @override
  String get stayDisabled => 'Stay Disabled';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get enable => 'Enable';
}
