import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String dateEDMY(Locale locale) {
    return DateFormat(
      'EEEE, dd-MM-yyyy',
      locale.languageCode,
    ).format(toLocal());
  }

  String dateDMY(Locale locale) {
    return DateFormat('dd-MM-yyyy', locale.languageCode).format(toLocal());
  }

  String timeHM(Locale locale) {
    return DateFormat('HH:mm', locale.languageCode).format(toLocal());
  }
}
