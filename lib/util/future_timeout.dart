import 'dart:async';

Future<T> futureTimeout<T>(
  Future<T> future, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  return future.timeout(
    timeout,
    onTimeout: () {
      throw TimeoutException(
        'The operation has timed out after ${timeout.inSeconds} seconds.',
      );
    },
  );
}
