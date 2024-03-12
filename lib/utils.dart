import 'package:flutter/material.dart';
import 'dart:math' as math;

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
  
  static String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
  
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - 3) + '...';
  }
  
  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Simple distance calculation (in kilometers)
    double dLat = (lat2 - lat1) * 3.14159 / 180;
    double dLon = (lon2 - lon1) * 3.14159 / 180;
    double a = (dLat/2).sin() * (dLat/2).sin() +
        lat1.cos() * lat2.cos() *
        (dLon/2).sin() * (dLon/2).sin();
    double c = 2 * a.sqrt().asin();
    return 6371 * c; // Earth's radius in kilometers
  }
  
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}

extension DoubleExtension on double {
  double sin() => math.sin(this * math.pi / 180);
  double cos() => math.cos(this * math.pi / 180);
  double asin() => math.asin(this);
  double sqrt() => math.sqrt(this);
}

extension DateTimeExtension on DateTime {
  double cos() => (this.toLocal().hour * math.pi / 180).cos();
}
