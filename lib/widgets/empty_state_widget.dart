import 'package:flutter/material.dart';
import '../constants.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? actionText;
  final VoidCallback? onAction;
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget? customIcon;
  final bool showAnimation;
  final bool showRetryButton;
  final VoidCallback? onRetry;
  final bool showError;
  final String? errorMessage;
  
  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.actionText,
    this.onAction,
    this.iconColor,
    this.backgroundColor,
    this.padding,
    this.customIcon,
    this.showAnimation = true,
    this.showRetryButton = false,
    this.onRetry,
    this.showError = false,
    this.errorMessage,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget iconWidget = customIcon ?? Icon(
      icon,
      size: 80,
      color: showError ? Colors.red : (iconColor ?? Colors.grey[400]),
    );
    
    if (showAnimation) {
      iconWidget = AnimatedContainer(
        duration: AppConstants.animationDuration,
        curve: Curves.easeInOut,
        child: iconWidget,
      );
    }
    
    return Container(
      padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding * 2),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: showError ? Colors.red : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          if (showError && errorMessage != null)
            Text(
              errorMessage!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            )
          else
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showRetryButton && onRetry != null)
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: 'Retry',
                  style: ElevatedButton.styleFrom(
                    backgroundColor: showError ? Colors.red : Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
              if (actionText != null && onAction != null)
                const SizedBox(width: 16),
              if (actionText != null && onAction != null)
                ElevatedButton(
                  onPressed: onAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: showError ? Colors.grey[600] : AppConstants.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text(actionText!),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmptyListWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onRefresh;
  final Widget? action;
  final bool isLoading;
  
  const EmptyListWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.onRefresh,
    this.action,
    this.isLoading = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.inbox_outlined,
          size: 64,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 24),
        if (onRefresh != null)
          ElevatedButton.icon(
            onPressed: isLoading ? null : onRefresh,
            icon: isLoading
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.refresh),
            label: 'Refresh',
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        if (action != null) action,
      ],
    );
  }
}
