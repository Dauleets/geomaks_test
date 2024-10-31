import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String hoursAndMinutes(
    BuildContext context,
  ) {
    // Example
    // 09:00
    if (this == null) {
      return '';
    } else {
      return DateFormat('HH:mm', context.currentLocale.localeCode)
          .format(this!);
    }
  }

  String dayWithMonthAndWeekDay(
    BuildContext context,
  ) {
    // Example
    // 17 мая, Cр
    if (this == null) {
      return '';
    } else {
      return DateFormat('d MMMM, EEE.', context.currentLocale.localeCode)
          .format(this!);
    }
  }

  String dayMonthName(
    BuildContext context,
  ) {
    // Example
    // 21 August
    if (this == null) {
      return '';
    } else {
      return DateFormat('d MMMM', context.currentLocale.localeCode)
          .format(this!);
    }
  }
}
