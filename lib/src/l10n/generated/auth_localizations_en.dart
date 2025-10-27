// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AuthLocalizationsEn extends AuthLocalizations {
  AuthLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginScreenTitle => 'Login to your account';

  @override
  String get login => 'Login';

  @override
  String get haveAnAccount => 'Have an account?';

  @override
  String get signupScreenTitle => 'Create new account';

  @override
  String get signup => 'Signup';

  @override
  String get doesntHaveAnAccount => 'Doesn\'t have an account?';

  @override
  String inputLabel(String label) {
    String _temp0 = intl.Intl.selectLogic(
      label,
      {
        'name': 'Name',
        'email': 'Email',
        'password': 'Password',
        'confirmPassword': 'Confirm Password',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String inputHint(String hint) {
    String _temp0 = intl.Intl.selectLogic(
      hint,
      {
        'name': 'Enter your name',
        'email': 'Enter your email',
        'password': 'Enter your password',
        'confirmPassword': 'Enter your password',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }

  @override
  String inputError(String error) {
    String _temp0 = intl.Intl.selectLogic(
      error,
      {
        'name_required': 'Name is required',
        'email_required': 'Email is required',
        'email_invalid': 'Email is invalid',
        'email_registered': 'Email is already registered',
        'credentials_mismatch': 'Email and password combination is incorrect',
        'password_required': 'Password is required',
        'password_tooShort': 'Password must be at least 8 characters long',
        'confirmPassword_required': 'Confirm password is required',
        'confirmPassword_mismatch': 'Confirm password and password does not match',
        'other': 'An unexpected error occurred',
      },
    );
    return '$_temp0';
  }

  @override
  String authSuccess(String success) {
    String _temp0 = intl.Intl.selectLogic(
      success,
      {
        'login_success': 'Login successful',
        'user_created_successfully': 'Account successfully created',
        'logout_success': 'Logout successful',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }
}
