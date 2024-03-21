import 'package:flutter/material.dart';
import '../constants.dart';
import '../app_config.dart';
import '../utils.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  
  const AppHeader({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onBackPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: AppConstants.fontFamily,
          fontWeight: FontWeight.w300,
          color: foregroundColor ?? Colors.white,
        ),
      ),
      backgroundColor: backgroundColor ?? AppConstants.primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      elevation: elevation ?? 2,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      actions: [
        if (actions != null) ...actions!,
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            AppUtils.showSnackBar(
              context,
              '${AppConfig.appName} v${AppConfig.appVersion}',
            );
          },
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
