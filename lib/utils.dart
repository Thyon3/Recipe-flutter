import 'package:flutter/material.dart';

class AppUtils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  
  static String formatCounter(int count) {
    return count.toString();
  }
  
  static bool isEven(int number) {
    return number % 2 == 0;
  }
}
