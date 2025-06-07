import 'package:flutter/material.dart';
import 'package:icar/util/validators/validations/validation.dart';

class ValidationPassword extends Validation<String> {
  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }
}
