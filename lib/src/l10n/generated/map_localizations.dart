import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'map_localizations_en.dart';
import 'map_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of MapLocalizations
/// returned by `MapLocalizations.of(context)`.
///
/// Applications need to include `MapLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/map_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: MapLocalizations.localizationsDelegates,
///   supportedLocales: MapLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the MapLocalizations.supportedLocales
/// property.
abstract class MapLocalizations {
  MapLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static MapLocalizations? of(BuildContext context) {
    return Localizations.of<MapLocalizations>(context, MapLocalizations);
  }

  static const LocalizationsDelegate<MapLocalizations> delegate = _MapLocalizationsDelegate();

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

  /// No description provided for @mapScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Track iCar'**
  String get mapScreenTitle;

  /// No description provided for @stopsForOneMinute.
  ///
  /// In en, this message translates to:
  /// **'Stops for 1 minute'**
  String get stopsForOneMinute;

  /// No description provided for @arrivalTime.
  ///
  /// In en, this message translates to:
  /// **'Arrival Time'**
  String get arrivalTime;

  /// No description provided for @session.
  ///
  /// In en, this message translates to:
  /// **'{session, select, SESSION_1{Session 1} SESSION_2{Session 2} other{Unknown value}}'**
  String session(String session);
}

class _MapLocalizationsDelegate extends LocalizationsDelegate<MapLocalizations> {
  const _MapLocalizationsDelegate();

  @override
  Future<MapLocalizations> load(Locale locale) {
    return SynchronousFuture<MapLocalizations>(lookupMapLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_MapLocalizationsDelegate old) => false;
}

MapLocalizations lookupMapLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return MapLocalizationsEn();
    case 'id': return MapLocalizationsId();
  }

  throw FlutterError(
    'MapLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
