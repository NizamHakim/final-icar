// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'notification_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class NotificationLocalizationsId extends NotificationLocalizations {
  NotificationLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get notificationPermissionTitle => 'Izin Notifikasi';

  @override
  String get notificationPermissionDesc => 'Anda akan mendapatkan notifikasi ketika iCar anda sudah dekat atau sudah tiba.';

  @override
  String get stayDisabled => 'Tetap Nonaktif';

  @override
  String get grantPermission => 'Berikan Izin';

  @override
  String get enable => 'Aktifkan';

  @override
  String get icarCloseNotificationTitle => 'iCar sudah dekat!';

  @override
  String get icarCloseNotificationBody => 'iCar sampai dalam beberapa menit. Ayo pergi ke halte!';

  @override
  String get icarArrivedNotificationTitle => 'iCar tiba di halte!';

  @override
  String get icarArrivedNotificationBody => 'Ayo naik iCar atau antre di waktu lain kalau iCar penuh!';

  @override
  String get reviewNotificationTitle => 'Bagaimana pengalamanmu dengan iCar hari ini?';

  @override
  String get reviewNotificationBody => 'Silakan berikan penilaian dan ulasan untuk membantu kami meningkatkan layanan.';

  @override
  String icarDisconnectNotificationTitle(Object icarName) {
    return '$icarName dinonaktifkan sementara!';
  }

  @override
  String get icarDisconnectNotificationBody => 'Semua tiket yang sedang dalam antrean telah dibatalkan. Mohon maaf atas ketidaknyamanannya.';
}
