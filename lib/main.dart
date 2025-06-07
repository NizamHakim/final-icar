import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icar/data/core/providers/locales.dart';
import 'package:icar/data/core/providers/current_user.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/root/authorized.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:flutter_gen/gen_l10n/map_localizations.dart';
import 'package:flutter_gen/gen_l10n/onboarding_localizations.dart';
import 'package:flutter_gen/gen_l10n/profile_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/ui/root/unaothorized.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = ref.watch(supportedLocalesProvider);
    final currentLocale = ref.watch(currentLocaleProvider);
    final isAuthorized = ref.watch(currentUserProvider).asData?.value != null;

    return _EagerInitialization(
      child: MaterialApp(
        title: 'iCar ITS',
        theme: AppTheme.lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          CoreLocalizations.delegate,
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
        home: isAuthorized ? const Authorized() : const Unaothorized(),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return currentUser.when(
      data: (user) {
        return child;
      },
      loading: () {
        return const Scaffold(body: CircularLoader());
      },
      error: (error, _) {
        return Scaffold(
          body: Center(
            child: Text(
              'Error: ${error.toString()}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
