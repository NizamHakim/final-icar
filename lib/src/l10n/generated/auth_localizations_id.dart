// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AuthLocalizationsId extends AuthLocalizations {
  AuthLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get loginScreenTitle => 'Masuk ke akunmu';

  @override
  String get login => 'Masuk';

  @override
  String get haveAnAccount => 'Sudah punya akun?';

  @override
  String get signupScreenTitle => 'Buat akun baru';

  @override
  String get signup => 'Daftar';

  @override
  String get doesntHaveAnAccount => 'Belum punya akun?';

  @override
  String inputLabel(String label) {
    String _temp0 = intl.Intl.selectLogic(
      label,
      {
        'name': 'Nama',
        'email': 'Email',
        'password': 'Password',
        'confirmPassword': 'Konfirmasi Password',
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
        'name': 'Masukkan nama',
        'email': 'Masukkan email',
        'password': 'Masukkan password',
        'confirmPassword': 'Masukkan password',
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
        'name_required': 'Nama tidak boleh kosong',
        'email_required': 'Email tidak boleh kosong',
        'email_invalid': 'Email tidak valid',
        'email_registered': 'Email sudah digunakan',
        'credentials_mismatch': 'Kombinasi email dan password salah',
        'password_required': 'Password tidak boleh kosong',
        'password_tooShort': 'Password minimal terdiri dari 8 karakter',
        'confirmPassword_required': 'Konfirmasi password tidak boleh kosong',
        'confirmPassword_mismatch': 'Konfirmasi password tidak sama dengan password',
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
        'login_success': 'Login berhasil',
        'user_created_successfully': 'Akun berhasil dibuat',
        'logout_success': 'Berhasil logout',
        'other': 'Unknown value',
      },
    );
    return '$_temp0';
  }
}
