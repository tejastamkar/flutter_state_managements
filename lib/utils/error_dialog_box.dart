import 'package:flutter/material.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

void showErrorDialog({required String message, required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
            size: context.isTablet ? 80 : 60,
          ),
          Text(
            "Error",
            style: TextStyle(
                fontSize: context.isTablet ? 26 : 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        message,
        style: TextStyle(fontSize: context.isTablet ? 22 : 18),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "OK",
            style: TextStyle(fontSize: context.isTablet ? 20 : 16),
          ),
        ),
      ],
    ),
  );
}
