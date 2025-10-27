import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'notification_localizations_en.dart';
import 'notification_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of NotificationLocalizations
/// returned by `NotificationLocalizations.of(context)`.
///
/// Applications need to include `NotificationLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/notification_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NotificationLocalizations.localizationsDelegates,
///   supportedLocales: NotificationLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the NotificationLocalizations.supportedLocales
/// property.
abstract class NotificationLocalizations {
  NotificationLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NotificationLocalizations? of(BuildContext context) {
    return Localizations.of<NotificationLocalizations>(context, NotificationLocalizations);
  }

  static const LocalizationsDelegate<NotificationLocalizations> delegate = _NotificationLocalizationsDelegate();

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

  /// No description provided for @notificationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermissionTitle;

  /// No description provided for @notificationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'You will be notified when your iCar is nearby or arrived.'**
  String get notificationPermissionDesc;

  /// No description provided for @stayDisabled.
  ///
  /// In en, this message translates to:
  /// **'Stay Disabled'**
  String get stayDisabled;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @icarCloseNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'iCar is nearby!'**
  String get icarCloseNotificationTitle;

  /// No description provided for @icarCloseNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'iCar will be arrived in couple of minutes. Lets go to the stop!'**
  String get icarCloseNotificationBody;

  /// No description provided for @icarArrivedNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'iCar has arrived at the stop!'**
  String get icarArrivedNotificationTitle;

  /// No description provided for @icarArrivedNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get to the iCar or queue for another time if it\'s fully occupied!'**
  String get icarArrivedNotificationBody;

  /// No description provided for @reviewNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'How was your experience with iCar today?'**
  String get reviewNotificationTitle;

  /// No description provided for @reviewNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Please rate and review to help us improve our service.'**
  String get reviewNotificationBody;

  /// No description provided for @icarDisconnectNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'{icarName} is temporarily deactivated!'**
  String icarDisconnectNotificationTitle(Object icarName);

  /// No description provided for @icarDisconnectNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'All tickets in queue have been cancelled. We apologize for the inconvenience.'**
  String get icarDisconnectNotificationBody;
}

class _NotificationLocalizationsDelegate extends LocalizationsDelegate<NotificationLocalizations> {
  const _NotificationLocalizationsDelegate();

  @override
  Future<NotificationLocalizations> load(Locale locale) {
    return SynchronousFuture<NotificationLocalizations>(lookupNotificationLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_NotificationLocalizationsDelegate old) => false;
}

NotificationLocalizations lookupNotificationLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return NotificationLocalizationsEn();
    case 'id': return NotificationLocalizationsId();
  }

  throw FlutterError(
    'NotificationLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
