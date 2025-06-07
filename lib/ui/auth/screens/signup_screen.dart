import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/auth/widgets/auth_input.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/util/validators/validations/validation_email.dart';
import 'package:icar/util/validators/validations/validation_password.dart';
import 'package:icar/util/validators/validations/validation_password_confirmation.dart';
import 'package:icar/util/validators/validations/validation_required.dart';
import 'package:icar/util/validators/validator.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary600,
      appBar: AppBar(title: const Text('Create new account')),
      body: RootContainer.roundedTop(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AuthInput(
                      label: 'Name',
                      hint: 'Enter your name',
                      controller: _nameController,
                      validator: Validator.apply(context, [
                        const ValidationRequired(label: 'Name'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: 'Email',
                      hint: 'Enter your email',
                      controller: _emailController,
                      validator: Validator.apply(context, [
                        const ValidationRequired(label: 'Email'),
                        ValidationEmail(),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: 'Password',
                      hint: 'Enter your password',
                      controller: _passwordController,
                      validator: Validator.apply(context, [
                        const ValidationRequired(label: 'Password'),
                        ValidationPassword(),
                      ]),
                      isObscure: true,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: 'Confirm Password',
                      hint: 'Enter your password',
                      controller: _confirmPasswordController,
                      validator: Validator.apply(context, [
                        const ValidationRequired(label: 'Confirm Password'),
                        ValidationPasswordConfirmation(
                          password: _passwordController.text,
                        ),
                      ]),
                      isObscure: true,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: AppColors.white,
                          backgroundColor: AppColors.primary600,
                          disabledBackgroundColor: AppColors.primary600
                              .withValues(alpha: 0.5),
                        ),
                        child: Text(
                          "Signup",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  text: "Have an account? ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Login",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
