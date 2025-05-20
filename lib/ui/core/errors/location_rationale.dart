import 'package:flutter/material.dart';

class LocationRationale extends StatelessWidget {
  const LocationRationale({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Location Permission",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: const Text(
        "This app uses user location to run most of its function. You cannot proceed to use the app without granting this permission.",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
          child: const Text("Allow"),
        ),
      ],
    );
  }
}
