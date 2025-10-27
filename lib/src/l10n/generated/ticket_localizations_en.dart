// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ticket_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class TicketLocalizationsEn extends TicketLocalizations {
  TicketLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get myQueueScreenTitle => 'My Queue';

  @override
  String ticketStatus(String status) {
    String _temp0 = intl.Intl.selectLogic(
      status,
      {
        'IN_QUEUE': 'In Queue',
        'CANCELED': 'Canceled',
        'FINISHED': 'Finished',
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
        'IN_QUEUE': 'No tickets in queue',
        'CANCELED': 'No tickets canceled',
        'FINISHED': 'No tickets finished',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get ticketDetailsScreenTitle => 'Queue Ticket';

  @override
  String get expiredAt => ' Expired at ';

  @override
  String get cancelTicketButtonLabel => 'Cancel queue';

  @override
  String ticketInfoTitle(String infoType) {
    String _temp0 = intl.Intl.selectLogic(
      infoType,
      {
        'CLOSE': 'iCar is nearby!',
        'ARRIVED': 'iCar has arrived at the stop!',
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
        'CLOSE': 'iCar will be arrived in couple of minutes. Lets go to the stop!',
        'ARRIVED': 'Let\'s get to the iCar or queue for another time if it\'s fully occupied!',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get queueTicketCanceled => 'Queue ticket canceled';

  @override
  String get icarHasArrived => 'iCar has arrived';

  @override
  String get reviewTicketButtonLabel => 'Review';

  @override
  String get reviewScreenTitle => 'Review';

  @override
  String get whatDoYouThink => 'What do you think?';

  @override
  String get whatIsGood => 'What is good?';

  @override
  String get whatShouldBeImproved => 'What should be improved?';

  @override
  String reviewOptions(String review) {
    String _temp0 = intl.Intl.selectLogic(
      review,
      {
        'PUNCTUALITY': 'Punctuality',
        'TRAVEL_SAFETY': 'Travel safety',
        'COMFORT': 'Comfort',
        'CLEANLINESS': 'Cleanliness',
        'TRAVEL_SPEED': 'Travel speed',
        'APPLICATION_SERVICE': 'Application service',
        'NUMBER_OF_SEATS': 'Number of seats',
        'TRAVEL_ROUTE': 'Travel route',
        'NUMBER_OF_STOPS': 'Number of stops',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String get anyOtherSuggestion => 'Any other suggestion?';

  @override
  String get enterSuggestion => 'Enter suggestion...';

  @override
  String get cancelTicketDialogTitle => 'Cancel iCar Queue';

  @override
  String get cancelTicketDialogDesc => 'This action will cancel your ticket permanently. Are you sure?';

  @override
  String get cancelTicketDialogSubmit => 'Cancel queue';

  @override
  String get cancelTicketDialogCancel => 'Stay on queue';

  @override
  String ticketSuccess(String success) {
    String _temp0 = intl.Intl.selectLogic(
      success,
      {
        'ticket_created_successfully': 'Ticket created successfully',
        'ticket_status_updated_successfully': 'Ticket updated successfully',
        'ticket_review_updated_successfully': 'Review updated successfully',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }
}
