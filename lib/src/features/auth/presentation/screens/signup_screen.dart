import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/auth/presentation/providers/signup.dart';
import 'package:icar/src/features/auth/presentation/providers/signup_form_errors.dart';
import 'package:icar/src/features/auth/presentation/widgets/auth_input.dart';
import 'package:icar/src/features/auth/presentation/widgets/submit_button.dart';
import 'package:icar/src/l10n/generated/auth_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';

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
    final isLoading = ref.watch(signupProvider).isLoading;
    final signupFormError = ref.watch(signupFormErrorsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AuthLocalizations.of(context)!.signupScreenTitle),
      ),
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
                      label: AuthLocalizations.of(context)!.inputLabel('name'),
                      hint: AuthLocalizations.of(context)!.inputHint('name'),
                      controller: _nameController,
                      errorText:
                          signupFormError.name != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputError(signupFormError.name!)
                              : null,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: AuthLocalizations.of(context)!.inputLabel('email'),
                      hint: AuthLocalizations.of(context)!.inputHint('email'),
                      controller: _emailController,
                      errorText:
                          signupFormError.email != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputError(signupFormError.email!)
                              : null,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: AuthLocalizations.of(
                        context,
                      )!.inputLabel('password'),
                      hint: AuthLocalizations.of(
                        context,
                      )!.inputHint('password'),
                      controller: _passwordController,
                      isObscure: true,
                      errorText:
                          signupFormError.password != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputError(signupFormError.password!)
                              : null,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: AuthLocalizations.of(
                        context,
                      )!.inputLabel('confirmPassword'),
                      hint: AuthLocalizations.of(
                        context,
                      )!.inputHint('confirmPassword'),
                      controller: _confirmPasswordController,
                      isObscure: true,
                      errorText:
                          signupFormError.confirmPassword != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputError(signupFormError.confirmPassword!)
                              : null,
                    ),
                    const SizedBox(height: 32),
                    SubmitButton(
                      isLoading: isLoading,
                      label: AuthLocalizations.of(context)!.signup,
                      onPressed: () async {
                        await ref
                            .read(signupProvider.notifier)
                            .signup(
                              _emailController.text,
                              _nameController.text,
                              _passwordController.text,
                              _confirmPasswordController.text,
                            );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  text: "${AuthLocalizations.of(context)!.haveAnAccount} ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () => context.go("/login"),
                        child: Text(
                          AuthLocalizations.of(context)!.login,
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
