// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'schedule_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class ScheduleLocalizationsId extends ScheduleLocalizations {
  ScheduleLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get scheduleNotYetAvailable => 'Antre dibuka 30 menit sebelum iCar tiba';

  @override
  String get confirmJoinQueueTitle => 'Konfirmasi antrean';

  @override
  String get confirmJoinQueueButtonLabel => 'Antre sekarang';

  @override
  String confirmJoinQueueDate(Object date) {
    return 'Hari ini, $date';
  }

  @override
  String get successJoinQueueNotification => 'Berhasil Masuk Antrean!';

  @override
  String get successJoinQueueDescription => 'Buka tiket antrean untuk melihat antreanmu.';

  @override
  String get successQueueTicket => 'Tiket antrean';

  @override
  String icarSeats(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kursi',
      one: '1 kursi',
    );
    return '$_temp0';
  }

  @override
  String peopleInQueue(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count orang',
      one: '1 orang',
    );
    return '$_temp0 dalam antrean';
  }

  @override
  String get noScheduleAvailable => 'Tidak ada jadwal tersedia';

  @override
  String get pleaseSelectOtherSchedule => 'Belum bisa antre. Silahkan memilih waktu lain yang tersedia.';
}
