// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'location_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class LocationLocalizationsId extends LocationLocalizations {
  LocationLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get locationPermissionError => 'Izin lokasi belum diberikan.';

  @override
  String get locationServiceError => 'Layanan lokasi belum diaktifkan.';

  @override
  String get stayDisabled => 'Tetap Nonaktif';

  @override
  String get grantPermission => 'Berikan Izin';

  @override
  String get enable => 'Aktifkan';
}
