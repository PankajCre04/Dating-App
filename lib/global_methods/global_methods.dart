import 'package:flutter/material.dart';

class GlobalMethods {
  static generateToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
