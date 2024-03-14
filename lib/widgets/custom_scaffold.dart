import 'package:flutter/material.dart';
import '../constants.dart';
import 'app_header.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: title),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      backgroundColor: Colors.grey[50],
    );
  }
}
