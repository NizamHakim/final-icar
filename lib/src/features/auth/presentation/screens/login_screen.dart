import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/auth/presentation/providers/login.dart';
import 'package:icar/src/features/auth/presentation/providers/login_form_errors.dart';
import 'package:icar/src/features/auth/presentation/widgets/auth_input.dart';
import 'package:icar/src/features/auth/presentation/widgets/submit_button.dart';
import 'package:icar/src/l10n/generated/auth_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController(text: "email@gmail.com");
  final _passwordController = TextEditingController(text: "00000000");
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginFormErrors = ref.watch(loginFormErrorsProvider);
    final isLoading = ref.watch(loginProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(AuthLocalizations.of(context)!.loginScreenTitle),
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
                      label: AuthLocalizations.of(context)!.inputLabel('email'),
                      hint: AuthLocalizations.of(context)!.inputHint('email'),
                      controller: _emailController,
                      errorText:
                          loginFormErrors.email != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputError(loginFormErrors.email!)
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
                          loginFormErrors.password != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputError(loginFormErrors.password!)
                              : null,
                    ),
                    const SizedBox(height: 32),
                    SubmitButton(
                      isLoading: isLoading,
                      label: AuthLocalizations.of(context)!.login,
                      onPressed: () async {
                        await ref
                            .read(loginProvider.notifier)
                            .login(
                              _emailController.text,
                              _passwordController.text,
                            );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  text:
                      "${AuthLocalizations.of(context)!.doesntHaveAnAccount} ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () => context.go("/signup"),
                        child: Text(
                          AuthLocalizations.of(context)!.signup,
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
