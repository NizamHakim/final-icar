import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void postResponseHandler<T>(
  BuildContext context,
  AsyncValue<T> next, {
  required VoidCallback onSuccess,
  VoidCallback? onError,
}) {
  if (next.hasValue &&
      !next.isLoading &&
      next.value != null &&
      context.mounted) {
    onSuccess();
  } else if (next.hasError && !next.isLoading && context.mounted) {
    onError?.call();
  }
}
