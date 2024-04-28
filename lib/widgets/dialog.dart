import 'package:flutter/material.dart';
import '../constants.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? contentWidget;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final bool insetPadding;
  final Clip clipBehavior;
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool scrollable;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final VoidCallback? onDismissed;

  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    this.contentWidget,
    this.actions,
    this.titleWidget,
    this.titlePadding,
    this.contentPadding,
    this.actionsPadding,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.alignment,
    this.insetPadding = true,
    this.clipBehavior = Clip.none,
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.scrollable = false,
    this.animationDuration,
    this.animationCurve,
    this.onDismissed,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    List<Widget>? actions,
    Widget? titleWidget,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool insetPadding = true,
    Clip clipBehavior = Clip.none,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool scrollable = false,
    Duration? animationDuration,
    Curve? animationCurve,
    VoidCallback? onDismissed,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      builder: (context) => CustomDialog(
        title: title,
        content: content,
        contentWidget: contentWidget,
        actions: actions,
        titleWidget: titleWidget,
        titlePadding: titlePadding,
        contentPadding: contentPadding,
        actionsPadding: actionsPadding,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        alignment: alignment,
        insetPadding: insetPadding,
        clipBehavior: clipBehavior,
        scrollable: scrollable,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
        onDismissed: onDismissed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 8.0,
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      insetPadding: insetPadding ? const EdgeInsets.all(16.0) : null,
      clipBehavior: clipBehavior,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          _buildContent(),
          if (actions != null && actions!.isNotEmpty) _buildActions(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    if (titleWidget != null) {
      return titleWidget!;
    }

    return Container(
      padding: titlePadding ?? const EdgeInsets.all(AppConstants.defaultPadding),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildContent() {
    if (contentWidget != null) {
      return contentWidget!;
    }

    if (content != null) {
      return Container(
        padding: contentPadding ?? const EdgeInsets.all(AppConstants.defaultPadding),
        child: Text(
          content!,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildActions() {
    return Container(
      padding: actionsPadding ?? const EdgeInsets.all(AppConstants.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions!,
      ),
    );
  }
}

class AlertDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? contentWidget;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmColor;
  final Color? cancelColor;
  final bool barrierDismissible;
  final VoidCallback? onDismissed;

  const AlertDialog({
    super.key,
    required this.title,
    this.content,
    this.contentWidget,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.confirmColor,
    this.cancelColor,
    this.barrierDismissible = true,
    this.onDismissed,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmColor,
    Color? cancelColor,
    bool barrierDismissible = true,
    VoidCallback? onDismissed,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: title,
        content: content,
        contentWidget: contentWidget,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmColor: confirmColor,
        cancelColor: cancelColor,
        barrierDismissible: barrierDismissible,
        onDismissed: onDismissed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: content,
      contentWidget: contentWidget,
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop(false);
            },
            style: TextButton.styleFrom(
              foregroundColor: cancelColor ?? Colors.grey[600],
            ),
            child: Text(cancelText!),
          ),
        if (confirmText != null)
          ElevatedButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop(true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: confirmColor ?? AppConstants.primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text(confirmText!),
          ),
      ],
      barrierDismissible: barrierDismissible,
      onDismissed: onDismissed,
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String? content;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmColor;
  final Color? cancelColor;
  final bool barrierDismissible;
  final VoidCallback? onDismissed;

  const ConfirmationDialog({
    super.key,
    required this.title,
    this.content,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.onConfirm,
    this.onCancel,
    this.confirmColor,
    this.cancelColor,
    this.barrierDismissible = true,
    this.onDismissed,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    String? content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmColor,
    Color? cancelColor,
    bool barrierDismissible = true,
    VoidCallback? onDismissed,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ConfirmationDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmColor: confirmColor,
        cancelColor: cancelColor,
        barrierDismissible: barrierDismissible,
        onDismissed: onDismissed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmColor: confirmColor ?? Colors.red,
      cancelColor: cancelColor,
      barrierDismissible: barrierDismissible,
      onDismissed: onDismissed,
    );
  }
}

class ProgressDialog extends StatelessWidget {
  final String title;
  final String? content;
  final bool showProgress;
  final double? progress;
  final String? progressText;
  final VoidCallback? onCancel;
  final String? cancelText;
  final Color? progressColor;
  final Color? backgroundColor;
  final bool barrierDismissible;
  final VoidCallback? onDismissed;

  const ProgressDialog({
    super.key,
    required this.title,
    this.content,
    this.showProgress = true,
    this.progress,
    this.progressText,
    this.onCancel,
    this.cancelText,
    this.progressColor,
    this.backgroundColor,
    this.barrierDismissible = false,
    this.onDismissed,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? content,
    bool showProgress = true,
    double? progress,
    String? progressText,
    VoidCallback? onCancel,
    String? cancelText,
    Color? progressColor,
    Color? backgroundColor,
    bool barrierDismissible = false,
    VoidCallback? onDismissed,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ProgressDialog(
        title: title,
        content: content,
        showProgress: showProgress,
        progress: progress,
        progressText: progressText,
        onCancel: onCancel,
        cancelText: cancelText,
        progressColor: progressColor,
        backgroundColor: backgroundColor,
        barrierDismissible: barrierDismissible,
        onDismissed: onDismissed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (content != null)
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Text(
                content!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          if (showProgress) ...[
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  progressColor ?? AppConstants.primaryColor,
                ),
              ),
            ),
            if (progressText != null)
              Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Text(
                  progressText!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ],
      ),
      actions: onCancel != null
          ? [
              TextButton(
                onPressed: () {
                  onCancel?.call();
                  Navigator.of(context).pop();
                },
                child: Text(cancelText ?? 'Cancel'),
              ),
            ]
          : null,
      backgroundColor: backgroundColor,
      barrierDismissible: barrierDismissible,
      onDismissed: onDismissed,
    );
  }
}
