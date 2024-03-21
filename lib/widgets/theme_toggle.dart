import 'package:flutter/material.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onPressed;
  
  const ThemeToggle({
    super.key,
    required this.isDark,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isDark ? Icons.light_mode : Icons.dark_mode,
      ),
      tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
    );
  }
}
