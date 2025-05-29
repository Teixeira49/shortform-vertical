

import 'package:flutter/material.dart';

class CustomSnackBar  {

  static void showBasicBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
    );
  }

  static void showWarningBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.warning_amber_rounded),
            Text(message, style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}