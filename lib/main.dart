import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:icar/app_initialization/initialization_provider/app_initialization.dart';
import 'package:icar/app_initialization/materials/error.dart';
import 'package:icar/app_initialization/materials/initialized.dart';
import 'package:icar/app_initialization/materials/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _EagerInitialization();
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInitializationState = ref.watch(appInitializationProvider);

    return appInitializationState.when(
      data: (_) {
        FlutterNativeSplash.remove();
        return const Initialized();
      },
      error: (error, _) {
        FlutterNativeSplash.remove();
        return InitializationError(errorMessage: error.toString());
      },
      loading: () => const InitializationLoading(),
    );
  }
}
