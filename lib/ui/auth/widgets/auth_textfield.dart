import 'package:flutter/material.dart';
import 'package:icar/ui/core/app_icons.dart';

class AuthTextfield extends StatefulWidget {
  const AuthTextfield({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isObscure = false,
  });

  final String label;
  final String hint;
  final bool isObscure;
  final TextEditingController controller;

  @override
  State<AuthTextfield> createState() {
    return _AuthTextfieldState();
  }
}

class _AuthTextfieldState extends State<AuthTextfield> {
  late bool currentlyObscure;

  @override
  void initState() {
    super.initState();
    currentlyObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: currentlyObscure,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            suffixIcon:
                widget.isObscure
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          currentlyObscure = !currentlyObscure;
                        });
                      },
                      icon: Icon(
                        currentlyObscure ? AppIcons.eye : AppIcons.eyeSlashed,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 20,
                      ),
                    )
                    : null,
          ),
          validator: (val) {
            if (val!.trim().isEmpty) {
              return "${widget.label} tidak boleh kosong!";
            }
            return null;
          },
        ),
      ],
    );
  }
}
