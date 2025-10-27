// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'shared_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class SharedLocalizationsId extends SharedLocalizations {
  SharedLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Antre iCar ITS';

  @override
  String get stop => 'Halte';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get submit => 'Selesai';

  @override
  String get logout => 'Keluar';

  @override
  String stopWithName(Object stopName) {
    return 'Halte $stopName';
  }

  @override
  String minutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menit',
      one: '1 menit',
    );
    return '$_temp0';
  }

  @override
  String get bottomNavHome => 'Beranda';

  @override
  String get bottomNavMyQueue => 'Antrean Saya';

  @override
  String get bottomNavProfile => 'Profil';
}
