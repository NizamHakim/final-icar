// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ticket_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class TicketLocalizationsId extends TicketLocalizations {
  TicketLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get myQueueScreenTitle => 'Antrean Saya';

  @override
  String ticketStatus(String status) {
    String _temp0 = intl.Intl.selectLogic(
      status,
      {
        'IN_QUEUE': 'Dalam antrean',
        'CANCELED': 'Dibatalkan',
        'FINISHED': 'Selesai',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String noTicketsByStatus(String status) {
    String _temp0 = intl.Intl.selectLogic(
      status,
      {
        'IN_QUEUE': 'Tidak ada tiket dalam antrean',
        'CANCELED': 'Tidak ada tiket dibatalkan',
        'FINISHED': 'Tidak ada tiket selesai',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get ticketDetailsScreenTitle => 'Tiket Antrean';

  @override
  String get expiredAt => ' Berlaku sampai ';

  @override
  String get cancelTicketButtonLabel => 'Batalkan antrean';

  @override
  String ticketInfoTitle(String infoType) {
    String _temp0 = intl.Intl.selectLogic(
      infoType,
      {
        'CLOSE': 'iCar sudah dekat!',
        'ARRIVED': 'iCar tiba di halte!',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String ticketInfoDescription(String infoType) {
    String _temp0 = intl.Intl.selectLogic(
      infoType,
      {
        'CLOSE': 'iCar sampai dalam beberapa menit. Ayo pergi ke halte!',
        'ARRIVED': 'Ayo naik iCar atau antre di waktu lain kalau iCar penuh!',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get queueTicketCanceled => 'Tiket antrean dibatalkan';

  @override
  String get icarHasArrived => 'iCar sudah tiba';

  @override
  String get reviewTicketButtonLabel => 'Review';

  @override
  String get reviewScreenTitle => 'Review';

  @override
  String get whatDoYouThink => 'Bagaimana pendapatmu?';

  @override
  String get whatIsGood => 'Apa yang sudah bagus?';

  @override
  String get whatShouldBeImproved => 'Apa yang perlu ditingkatkan?';

  @override
  String reviewOptions(String review) {
    String _temp0 = intl.Intl.selectLogic(
      review,
      {
        'PUNCTUALITY': 'Ketepatan jadwal',
        'TRAVEL_SAFETY': 'Keamanan perjalanan',
        'COMFORT': 'Kenyamanan',
        'CLEANLINESS': 'Kebersihan',
        'TRAVEL_SPEED': 'Kecepatan',
        'APPLICATION_SERVICE': 'Layanan aplikasi',
        'NUMBER_OF_SEATS': 'Jumlah kursi',
        'TRAVEL_ROUTE': 'Rute perjalanan',
        'NUMBER_OF_STOPS': 'Jumlah halte',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get anyOtherSuggestion => 'Ada saran lain?';

  @override
  String get enterSuggestion => 'Masukkan saran...';

  @override
  String get cancelTicketDialogTitle => 'Batalkan Antrean iCar';

  @override
  String get cancelTicketDialogDesc => 'Perlu diingat bahwa pembatalan ini bersifat permanen. Apakah anda ingin melanjutkan?';

  @override
  String get cancelTicketDialogSubmit => 'Batalkan antrean';

  @override
  String get cancelTicketDialogCancel => 'Tetap antre';

  @override
  String ticketSuccess(String success) {
    String _temp0 = intl.Intl.selectLogic(
      success,
      {
        'ticket_created_successfully': 'Tiket berhasil dibuat',
        'ticket_status_updated_successfully': 'Tiket berhasil di update',
        'ticket_review_updated_successfully': 'Review berhasil di update',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }
}
