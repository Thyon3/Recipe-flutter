import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isLoading;
  final Widget? icon;
  final ButtonSize size;
  final ButtonVariant variant;
  
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.onLongPress,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledColor,
    this.disabledTextColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.isLoading = false,
    this.icon,
    this.size = ButtonSize.medium,
    this.variant = ButtonVariant.filled,
  });
  
  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle();
    
    Widget buttonChild = _buildButtonChild();
    
    switch (variant) {
      case ButtonVariant.filled:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          onLongPress: onLongPress,
          style: buttonStyle,
          child: buttonChild,
        );
      case ButtonVariant.outlined:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          onLongPress: onLongPress,
          style: buttonStyle,
          child: buttonChild,
        );
      case ButtonVariant.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          onLongPress: onLongPress,
          style: buttonStyle,
          child: buttonChild,
        );
    }
  }
  
  ButtonStyle _getButtonStyle() {
    final padding = _getPadding();
    final borderRadius = BorderRadius.circular(this.borderRadius ?? AppConstants.borderRadius);
    
    switch (variant) {
      case ButtonVariant.filled:
        return ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppConstants.primaryColor,
          foregroundColor: foregroundColor ?? Colors.white,
          disabledBackgroundColor: disabledColor ?? Colors.grey[300],
          disabledForegroundColor: disabledTextColor ?? Colors.grey[600],
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: textStyle,
        );
      case ButtonVariant.outlined:
        return OutlinedButton.styleFrom(
          foregroundColor: backgroundColor ?? AppConstants.primaryColor,
          disabledForegroundColor: disabledTextColor ?? Colors.grey[600],
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          side: BorderSide(color: backgroundColor ?? AppConstants.primaryColor),
          textStyle: textStyle,
        );
      case ButtonVariant.text:
        return TextButton.styleFrom(
          foregroundColor: backgroundColor ?? AppConstants.primaryColor,
          disabledForegroundColor: disabledTextColor ?? Colors.grey[600],
          padding: padding,
          textStyle: textStyle,
        );
    }
  }
  
  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    }
  }
  
  Widget _buildButtonChild() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == ButtonVariant.filled
                ? (foregroundColor ?? Colors.white)
                : (backgroundColor ?? AppConstants.primaryColor),
          ),
        ),
      );
    }
    
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }
    
    return Text(text);
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? size;
  final String? tooltip;
  final bool isLoading;
  
  const IconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.onLongPress,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledColor,
    this.borderRadius,
    this.padding,
    this.size,
    this.tooltip,
    this.isLoading = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: Material(
        color: backgroundColor ?? AppConstants.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          child: Container(
            padding: padding ?? const EdgeInsets.all(12),
            child: isLoading
                ? SizedBox(
                    width: size ?? 24,
                    height: size ?? 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        foregroundColor ?? Colors.white,
                      ),
                    ),
                  )
                : Icon(
                    icon,
                    size: size ?? 24,
                    color: foregroundColor ?? Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

enum ButtonSize {
  small,
  medium,
  large,
}

enum ButtonVariant {
  filled,
  outlined,
  text,
}
