import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initialization_provider.g.dart';

@riverpod
class InitializationProvider extends _$InitializationProvider {
  @override
  Future<void> build() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
