import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'ticket_localizations_en.dart';
import 'ticket_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of TicketLocalizations
/// returned by `TicketLocalizations.of(context)`.
///
/// Applications need to include `TicketLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/ticket_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TicketLocalizations.localizationsDelegates,
///   supportedLocales: TicketLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the TicketLocalizations.supportedLocales
/// property.
abstract class TicketLocalizations {
  TicketLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TicketLocalizations? of(BuildContext context) {
    return Localizations.of<TicketLocalizations>(context, TicketLocalizations);
  }

  static const LocalizationsDelegate<TicketLocalizations> delegate = _TicketLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @myQueueScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'My Queue'**
  String get myQueueScreenTitle;

  /// No description provided for @ticketStatus.
  ///
  /// In en, this message translates to:
  /// **'{status, select, IN_QUEUE{In Queue} CANCELED{Canceled} FINISHED{Finished} other{Unknown value}}'**
  String ticketStatus(String status);

  /// No description provided for @noTicketsByStatus.
  ///
  /// In en, this message translates to:
  /// **'{status, select, IN_QUEUE{No tickets in queue} CANCELED{No tickets canceled} FINISHED{No tickets finished} other{Unknown value}}'**
  String noTicketsByStatus(String status);

  /// No description provided for @ticketDetailsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Queue Ticket'**
  String get ticketDetailsScreenTitle;

  /// No description provided for @expiredAt.
  ///
  /// In en, this message translates to:
  /// **' Expired at '**
  String get expiredAt;

  /// No description provided for @cancelTicketButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel queue'**
  String get cancelTicketButtonLabel;

  /// No description provided for @ticketInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'{infoType, select, CLOSE{iCar is nearby!} ARRIVED{iCar has arrived at the stop!} other{Unknown value}}'**
  String ticketInfoTitle(String infoType);

  /// No description provided for @ticketInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'{infoType, select, CLOSE{iCar will be arrived in couple of minutes. Lets go to the stop!} ARRIVED{Let\'s get to the iCar or queue for another time if it\'s fully occupied!} other{Unknown value}}'**
  String ticketInfoDescription(String infoType);

  /// No description provided for @queueTicketCanceled.
  ///
  /// In en, this message translates to:
  /// **'Queue ticket canceled'**
  String get queueTicketCanceled;

  /// No description provided for @icarHasArrived.
  ///
  /// In en, this message translates to:
  /// **'iCar has arrived'**
  String get icarHasArrived;

  /// No description provided for @reviewTicketButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewTicketButtonLabel;

  /// No description provided for @reviewScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewScreenTitle;

  /// No description provided for @whatDoYouThink.
  ///
  /// In en, this message translates to:
  /// **'What do you think?'**
  String get whatDoYouThink;

  /// No description provided for @whatIsGood.
  ///
  /// In en, this message translates to:
  /// **'What is good?'**
  String get whatIsGood;

  /// No description provided for @whatShouldBeImproved.
  ///
  /// In en, this message translates to:
  /// **'What should be improved?'**
  String get whatShouldBeImproved;

  /// No description provided for @reviewOptions.
  ///
  /// In en, this message translates to:
  /// **'{review, select, PUNCTUALITY{Punctuality} TRAVEL_SAFETY{Travel safety} COMFORT{Comfort} CLEANLINESS{Cleanliness} TRAVEL_SPEED{Travel speed} APPLICATION_SERVICE{Application service} NUMBER_OF_SEATS{Number of seats} TRAVEL_ROUTE{Travel route} NUMBER_OF_STOPS{Number of stops} other{Unknown value}}'**
  String reviewOptions(String review);

  /// No description provided for @anyOtherSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Any other suggestion?'**
  String get anyOtherSuggestion;

  /// No description provided for @enterSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Enter suggestion...'**
  String get enterSuggestion;

  /// No description provided for @cancelTicketDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel iCar Queue'**
  String get cancelTicketDialogTitle;

  /// No description provided for @cancelTicketDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'This action will cancel your ticket permanently. Are you sure?'**
  String get cancelTicketDialogDesc;

  /// No description provided for @cancelTicketDialogSubmit.
  ///
  /// In en, this message translates to:
  /// **'Cancel queue'**
  String get cancelTicketDialogSubmit;

  /// No description provided for @cancelTicketDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Stay on queue'**
  String get cancelTicketDialogCancel;

  /// No description provided for @ticketSuccess.
  ///
  /// In en, this message translates to:
  /// **'{success, select, ticket_created_successfully{Ticket created successfully} ticket_status_updated_successfully{Ticket updated successfully} ticket_review_updated_successfully{Review updated successfully} other{Unknown value}}'**
  String ticketSuccess(String success);
}

class _TicketLocalizationsDelegate extends LocalizationsDelegate<TicketLocalizations> {
  const _TicketLocalizationsDelegate();

  @override
  Future<TicketLocalizations> load(Locale locale) {
    return SynchronousFuture<TicketLocalizations>(lookupTicketLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_TicketLocalizationsDelegate old) => false;
}

TicketLocalizations lookupTicketLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TicketLocalizationsEn();
    case 'id': return TicketLocalizationsId();
  }

  throw FlutterError(
    'TicketLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
