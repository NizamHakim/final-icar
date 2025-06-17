import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/auth_localizations.dart';
import 'package:icar/ui/auth/screens/login_screen.dart';
import 'package:icar/ui/auth/viewmodels/signup/signup_viewmodel.dart';
import 'package:icar/ui/auth/widgets/auth_input.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/root/authorized.dart';
import 'package:icar/util/post_response_handler.dart';
import 'package:icar/util/show_snackbar.dart';

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
    final isLoading = ref.watch(createNewUserProvider).isLoading;
    final signupFormError = ref.watch(signupFormErrorProvider);

    ref.listen(createNewUserProvider, (_, next) {
      postResponseHandler(
        context,
        next,
        onSuccess: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Authorized()),
          );
        },
        onError: () {
          showSnackBar(
            context,
            SnackBar(
              content: Text(
                CoreLocalizations.of(context)!.internalServerError,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.error500,
            ),
          );
        },
      );
    });

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
                      label: AuthLocalizations.of(context)!.inputNameLabel,
                      hint: AuthLocalizations.of(context)!.inputNameHint,
                      controller: _nameController,
                      errorText:
                          signupFormError.name != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputNameError(signupFormError.name!)
                              : null,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: AuthLocalizations.of(context)!.inputEmailLabel,
                      hint: AuthLocalizations.of(context)!.inputEmailHint,
                      controller: _emailController,
                      errorText:
                          signupFormError.email != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputEmailError(signupFormError.email!)
                              : null,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label: AuthLocalizations.of(context)!.inputPasswordLabel,
                      hint: AuthLocalizations.of(context)!.inputPasswordHint,
                      controller: _passwordController,
                      isObscure: true,
                      errorText:
                          signupFormError.password != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputPasswordError(signupFormError.password!)
                              : null,
                    ),
                    const SizedBox(height: 20),
                    AuthInput(
                      label:
                          AuthLocalizations.of(
                            context,
                          )!.inputConfirmPasswordLabel,
                      hint:
                          AuthLocalizations.of(
                            context,
                          )!.inputConfirmPasswordHint,
                      controller: _confirmPasswordController,
                      isObscure: true,
                      errorText:
                          signupFormError.confirmPassword != null
                              ? AuthLocalizations.of(
                                context,
                              )!.inputConfirmPasswordError(
                                signupFormError.confirmPassword!,
                              )
                              : null,
                    ),
                    const SizedBox(height: 32),
                    _submitButton(context, isLoading),
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
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
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

  Widget _submitButton(BuildContext context, bool isLoading) {
    if (isLoading) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.primary600,
            disabledBackgroundColor: AppColors.primary600.withValues(
              alpha: 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularLoader(size: 14, color: AppColors.white),
              const SizedBox(width: 8),
              Text(
                AuthLocalizations.of(context)!.signup,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await ref
              .read(createNewUserProvider.notifier)
              .createUser(
                _nameController.text,
                _emailController.text,
                _passwordController.text,
                _confirmPasswordController.text,
              );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary600,
          disabledBackgroundColor: AppColors.primary600.withValues(alpha: 0.5),
        ),
        child: Text(
          AuthLocalizations.of(context)!.signup,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
