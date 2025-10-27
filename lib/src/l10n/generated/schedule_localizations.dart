import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'schedule_localizations_en.dart';
import 'schedule_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ScheduleLocalizations
/// returned by `ScheduleLocalizations.of(context)`.
///
/// Applications need to include `ScheduleLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/schedule_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ScheduleLocalizations.localizationsDelegates,
///   supportedLocales: ScheduleLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ScheduleLocalizations.supportedLocales
/// property.
abstract class ScheduleLocalizations {
  ScheduleLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ScheduleLocalizations? of(BuildContext context) {
    return Localizations.of<ScheduleLocalizations>(context, ScheduleLocalizations);
  }

  static const LocalizationsDelegate<ScheduleLocalizations> delegate = _ScheduleLocalizationsDelegate();

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

  /// No description provided for @scheduleNotYetAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available for queue 30 minutes before iCar arrives'**
  String get scheduleNotYetAvailable;

  /// No description provided for @confirmJoinQueueTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm queue'**
  String get confirmJoinQueueTitle;

  /// No description provided for @confirmJoinQueueButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Join queue'**
  String get confirmJoinQueueButtonLabel;

  /// No description provided for @confirmJoinQueueDate.
  ///
  /// In en, this message translates to:
  /// **'Today, {date}'**
  String confirmJoinQueueDate(Object date);

  /// No description provided for @successJoinQueueNotification.
  ///
  /// In en, this message translates to:
  /// **'Successfully Added to Queue!'**
  String get successJoinQueueNotification;

  /// No description provided for @successJoinQueueDescription.
  ///
  /// In en, this message translates to:
  /// **'Open ticket to see your queue details'**
  String get successJoinQueueDescription;

  /// No description provided for @successQueueTicket.
  ///
  /// In en, this message translates to:
  /// **'Queue ticket'**
  String get successQueueTicket;

  /// No description provided for @icarSeats.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 seat} other{{count} seats}}'**
  String icarSeats(num count);

  /// No description provided for @peopleInQueue.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 person} other{{count} people}} in queue'**
  String peopleInQueue(num count);

  /// No description provided for @noScheduleAvailable.
  ///
  /// In en, this message translates to:
  /// **'No schedule available'**
  String get noScheduleAvailable;

  /// No description provided for @pleaseSelectOtherSchedule.
  ///
  /// In en, this message translates to:
  /// **'Not yet available. Please select other available schedule.'**
  String get pleaseSelectOtherSchedule;
}

class _ScheduleLocalizationsDelegate extends LocalizationsDelegate<ScheduleLocalizations> {
  const _ScheduleLocalizationsDelegate();

  @override
  Future<ScheduleLocalizations> load(Locale locale) {
    return SynchronousFuture<ScheduleLocalizations>(lookupScheduleLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_ScheduleLocalizationsDelegate old) => false;
}

ScheduleLocalizations lookupScheduleLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return ScheduleLocalizationsEn();
    case 'id': return ScheduleLocalizationsId();
  }

  throw FlutterError(
    'ScheduleLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
