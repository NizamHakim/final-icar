import 'package:flutter/material.dart';

class NotificationRationale extends StatelessWidget {
  const NotificationRationale({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Notification Permission",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: const Text(
        "We will notify you when iCar in your tickets has arrived.",
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
