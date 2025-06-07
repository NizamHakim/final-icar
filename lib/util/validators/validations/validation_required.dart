import 'package:flutter/material.dart';
import 'package:icar/util/validators/validations/validation.dart';

class ValidationRequired<T> extends Validation<T> {
  const ValidationRequired({required this.label});

  final String label;

  @override
  String? validate(BuildContext context, T? value) {
    if (value == null) return '$label is required';

    if (value is String && (value as String).isEmpty) {
      return '$label is required';
    }

    return null;
  }
}
