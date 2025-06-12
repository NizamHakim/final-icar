import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/auth_localizations.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:flutter_gen/gen_l10n/map_localizations.dart';
import 'package:flutter_gen/gen_l10n/onboarding_localizations.dart';
import 'package:flutter_gen/gen_l10n/profile_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/ui/core/themes/app_theme.dart';
import 'package:icar/ui/onboarding/screens/onboarding_screen.dart';
import 'package:icar/ui/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:icar/ui/root/authorized.dart';
import 'package:icar/ui/root/unaothorized.dart';

class Initialized extends ConsumerWidget {
  const Initialized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = ref.watch(supportedLocalesProvider);
    final currentLocale = ref.watch(currentLocaleProvider);
    final currentUser = ref.watch(currentUserProvider);
    final shouldShowOnboarding = ref.read(shouldShowOnboardingProvider);

    return MaterialApp(
      title: 'iCar ITS',
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        CoreLocalizations.delegate,
        AuthLocalizations.delegate,
        HomeLocalizations.delegate,
        MapLocalizations.delegate,
        OnboardingLocalizations.delegate,
        ProfileLocalizations.delegate,
        QueueLocalizations.delegate,
        TicketLocalizations.delegate,
      ],
      supportedLocales:
          supportedLocales.map((appLocale) => appLocale.locale).toList(),
      locale: currentLocale,
      home: _content(currentUser, shouldShowOnboarding),
    );
  }

  Widget _content(User? currentUser, bool shouldShowOnboarding) {
    if (shouldShowOnboarding) {
      return const OnboardingScreen();
    } else {
      return currentUser == null ? const Unaothorized() : const Authorized();
    }
  }
}
