import 'package:flutter/material.dart';
import 'package:icar/ui/auth/screens/login_screen.dart';
import 'package:icar/ui/auth/screens/signup_screen.dart';

class Unauthorized extends StatelessWidget {
  const Unauthorized({super.key, this.logout = false});

  final bool logout;

  @override
  Widget build(BuildContext context) {
    return (logout) ? const LoginScreen() : const SignupScreen();
  }
}
