import 'package:flutter/material.dart';
import 'package:icar/util/validators/validations/validation.dart';

class ValidationEmail extends Validation<String> {
  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }
}
