// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'notification_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class NotificationLocalizationsEn extends NotificationLocalizations {
  NotificationLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get notificationPermissionTitle => 'Notification Permission';

  @override
  String get notificationPermissionDesc => 'You will be notified when your iCar is nearby or arrived.';

  @override
  String get stayDisabled => 'Stay Disabled';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get enable => 'Enable';

  @override
  String get icarCloseNotificationTitle => 'iCar is nearby!';

  @override
  String get icarCloseNotificationBody => 'iCar will be arrived in couple of minutes. Lets go to the stop!';

  @override
  String get icarArrivedNotificationTitle => 'iCar has arrived at the stop!';

  @override
  String get icarArrivedNotificationBody => 'Let\'s get to the iCar or queue for another time if it\'s fully occupied!';

  @override
  String get reviewNotificationTitle => 'How was your experience with iCar today?';

  @override
  String get reviewNotificationBody => 'Please rate and review to help us improve our service.';

  @override
  String icarDisconnectNotificationTitle(Object icarName) {
    return '$icarName is temporarily deactivated!';
  }

  @override
  String get icarDisconnectNotificationBody => 'All tickets in queue have been cancelled. We apologize for the inconvenience.';
}
