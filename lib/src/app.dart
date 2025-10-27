import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/themes/app_theme.dart';
import 'package:icar/src/core/routes/router.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/l10n/generated/auth_localizations.dart';
import 'package:icar/src/l10n/generated/failure_localizations.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/l10n/generated/onboarding_localizations.dart';
import 'package:icar/src/l10n/generated/profile_localizations.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/l10n/generated/map_localizations.dart';
import 'package:icar/src/l10n/generated/location_localizations.dart';
import 'package:icar/src/l10n/generated/notification_localizations.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/core/config/supported_locales.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'iCar ITS',
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SharedLocalizations.delegate,
        AuthLocalizations.delegate,
        HomeLocalizations.delegate,
        MapLocalizations.delegate,
        OnboardingLocalizations.delegate,
        ProfileLocalizations.delegate,
        ScheduleLocalizations.delegate,
        TicketLocalizations.delegate,
        LocationLocalizations.delegate,
        NotificationLocalizations.delegate,
        FailureLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: currentLocale,
      routerConfig: router,
    );
  }
}
