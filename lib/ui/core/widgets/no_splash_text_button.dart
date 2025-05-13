import 'package:flutter/material.dart';

class NoSplashTextButton extends StatelessWidget {
  const NoSplashTextButton({
    super.key,
    required this.onTap,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
  });

  final Text label;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            if (leadingIcon != null)
              WidgetSpan(
                child: leadingIcon!,
                alignment: PlaceholderAlignment.middle,
              ),
            TextSpan(text: label.data, style: label.style),
            if (trailingIcon != null)
              WidgetSpan(
                child: trailingIcon!,
                alignment: PlaceholderAlignment.middle,
              ),
          ],
        ),
      ),
    );
  }
}
