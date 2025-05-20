import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_icons.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.onTap,
  });

  final IconData leadingIcon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        AppIcons.arrowRight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
