// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class HomeLocalizationsId extends HomeLocalizations {
  HomeLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String checkQueueLabel(String label) {
    String _temp0 = intl.Intl.selectLogic(
      label,
      {
        'stop': 'Halte',
        'route': 'Rute',
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
        'stop': 'Pilih halte',
        'route': 'Pilih rute',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get checkQueueSubmitButton => 'Cek antrean iCar';

  @override
  String selectStopLabel(String label) {
    String _temp0 = intl.Intl.selectLogic(
      label,
      {
        'latest_search': 'Pencarian terbaru',
        'all_options': 'Halte',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get selectStopFindStopHint => 'Cari halte...';

  @override
  String get selectStopNoStopMatched => 'Tidak ada halte yang cocok';

  @override
  String get noUpcomingTicket => 'Tidak ada tiket antrian yang akan datang';

  @override
  String get viewAll => 'Lihat semua';
}
