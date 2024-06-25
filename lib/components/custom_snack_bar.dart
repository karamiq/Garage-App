
import 'package:flutter/material.dart';

class CustomErrorSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Theme.of(context).colorScheme.error),
            SizedBox(width: 8.0),
            Text(
              message,
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2.0, // Adjust as needed
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0), // Adjust as needed
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}