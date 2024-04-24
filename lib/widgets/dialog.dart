import 'package:flutter/material.dart';
import '../constants.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? customContent;
  final List<Widget>? actions;
  final VoidCallback? onDismiss;
  
  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    this.customContent,
    this.actions,
    this.onDismiss,
  });
  
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? content,
    Widget? customContent,
    List<Widget>? actions,
    VoidCallback? onDismiss,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => CustomDialog(
        title: title,
        content: content,
        customContent: customContent,
        actions: actions,
        onDismiss: onDismiss,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (onDismiss != null)
                  IconButton(
                    onPressed: () {
                      onDismiss!();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
            if (content != null) ...[
              const SizedBox(height: 16),
              Text(
                content!,
                style: const TextStyle(fontSize: 16),
              ),
            ],
            if (customContent != null) ...[
              const SizedBox(height: 16),
              customContent!,
            ],
            if (actions != null) ...[
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmColor;
  
  const AlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.confirmColor,
  });
  
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmColor: confirmColor,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: message,
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop(false);
            },
            child: Text(cancelText!),
          ),
        ElevatedButton(
          onPressed: () {
            onConfirm?.call();
            Navigator.of(context).pop(true);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmColor ?? Colors.red,
            foregroundColor: Colors.white,
          ),
          child: Text(confirmText ?? 'Confirm'),
        ),
      ],
    );
  }
}
