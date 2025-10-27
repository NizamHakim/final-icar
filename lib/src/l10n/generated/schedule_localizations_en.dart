// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'schedule_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ScheduleLocalizationsEn extends ScheduleLocalizations {
  ScheduleLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get scheduleNotYetAvailable => 'Available for queue 30 minutes before iCar arrives';

  @override
  String get confirmJoinQueueTitle => 'Confirm queue';

  @override
  String get confirmJoinQueueButtonLabel => 'Join queue';

  @override
  String confirmJoinQueueDate(Object date) {
    return 'Today, $date';
  }

  @override
  String get successJoinQueueNotification => 'Successfully Added to Queue!';

  @override
  String get successJoinQueueDescription => 'Open ticket to see your queue details';

  @override
  String get successQueueTicket => 'Queue ticket';

  @override
  String icarSeats(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seats',
      one: '1 seat',
    );
    return '$_temp0';
  }

  @override
  String peopleInQueue(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0 in queue';
  }

  @override
  String get noScheduleAvailable => 'No schedule available';

  @override
  String get pleaseSelectOtherSchedule => 'Not yet available. Please select other available schedule.';
}
