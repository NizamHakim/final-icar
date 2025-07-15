import 'package:icar/init/provider/init_app.dart';
import 'package:icar/init/materials/error.dart';
import 'package:icar/init/materials/initialized.dart';
import 'package:icar/init/materials/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    final appInitializationState = ref.watch(initAppProvider);

    return appInitializationState.when(
      data: (_) {
        return const Initialized();
      },
      error: (error, st) {
        return InitializationError(errorMessage: error.toString());
      },
      loading: () {
        return const InitializationLoading();
      },
    );
  }
}
