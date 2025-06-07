import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';

class AuthInput extends StatefulWidget {
  const AuthInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    this.errorText,
    this.isObscure = false,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool isObscure;

  @override
  State<AuthInput> createState() {
    return _AuthInputState();
  }
}

class _AuthInputState extends State<AuthInput> {
  late bool currentlyObscure;

  @override
  void initState() {
    super.initState();
    currentlyObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray700),
        ),
        const SizedBox(height: 6),
        TextFormField(
          obscureText: currentlyObscure,
          decoration: InputDecoration(
            errorText: widget.errorText,
            hintText: widget.hint,
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
            suffixIcon:
                widget.isObscure
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          currentlyObscure = !currentlyObscure;
                        });
                      },
                      icon: AppIcon(
                        iconSvg:
                            currentlyObscure
                                ? AppIconsSvg.eye
                                : AppIconsSvg.eyeOff,
                        color: AppColors.gray400,
                        size: 20,
                      ),
                    )
                    : null,
          ),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.gray900),
          validator: widget.validator,
        ),
      ],
    );
  }
}
