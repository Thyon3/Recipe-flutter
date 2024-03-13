import 'package:flutter/material.dart';
import '../constants.dart';
import '../app_config.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const AppHeader({
    super.key,
    required this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: AppConstants.fontFamily,
          fontWeight: FontWeight.w300,
        ),
      ),
      backgroundColor: AppConstants.primaryColor,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${AppConfig.appName} v${AppConfig.appVersion}'),
              ),
            );
          },
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
