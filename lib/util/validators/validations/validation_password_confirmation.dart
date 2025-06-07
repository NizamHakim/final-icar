import 'package:flutter/material.dart';
import 'package:icar/util/validators/validations/validation.dart';

class ValidationPasswordConfirmation extends Validation<String> {
  const ValidationPasswordConfirmation({required this.password});

  final String? password;

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Password confirmation is required';
    }

    if (password == null || password != value) {
      return 'Passwords do not match';
    }

    return null;
  }
}
