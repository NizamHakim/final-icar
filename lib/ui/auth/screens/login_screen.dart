import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/root_container.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary600,
      appBar: AppBar(title: const Text('Create new account')),
      body: const RootContainer.roundedTop(
        child: SingleChildScrollView(child: Column(children: [])),
      ),
    );
  }
}
