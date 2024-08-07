import 'package:flutter/material.dart';

Future<DateTime?> openDatePicker(
    {required BuildContext context, DateTime? initialDate}) async {
  DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: initialDate ?? DateTime.now());

  return selectedDate;
}
