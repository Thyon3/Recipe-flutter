import 'package:flutter/material.dart';
import '../constants.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Widget? avatar;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledColor;
  final Color? selectedColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? labelStyle;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? splashColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? elevation;
  final bool pressElevation;
  final Color? pressColor;
  final bool showCheckmark;
  final bool isSelected;
  final bool enableFeedback;
  final bool allowChipTap;
  final double? borderRadius;
  final bool showIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool animated;
  final Duration animationDuration;
  final Curve animationCurve;
  
  const CustomChip({
    super.key,
    required this.label,
    this.avatar,
    this.deleteIcon,
    this.onDeleted,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.disabledColor,
    this.selectedColor,
    this.shadowColor,
    this.padding,
    this.labelPadding,
    this.labelStyle,
    this.side,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.splashColor,
    this.materialTapTargetSize,
    this.elevation,
    this.pressElevation = true,
    this.pressColor,
    this.showCheckmark = false,
    this.isSelected = false,
    this.enableFeedback = true,
    this.allowChipTap = true,
    this.borderRadius,
    this.showIcon = false,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.animated = true,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget chip = Container(
      decoration: BoxDecoration(
        color: isSelected ? (selectedColor ?? AppConstants.primaryColor) : backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: side,
        boxShadow: elevation != null
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.black.withOpacity(0.1),
                  blurRadius: elevation!,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: allowChipTap ? onPressed : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (avatar != null) avatar,
                if (showIcon && icon != null) ...[
                  Icon(
                    icon,
                    size: iconSize ?? 16,
                    color: iconColor ?? (isSelected ? Colors.white : textColor),
                  ),
                  const SizedBox(width: 8),
                ],
                if (showCheckmark)
                  Icon(
                    Icons.check,
                    size: 16,
                    color: isSelected ? Colors.white : textColor,
                  ),
                Flexible(
                  child: Padding(
                    padding: labelPadding ?? EdgeInsets.zero,
                    child: Text(
                      label,
                      style: labelStyle ?? TextStyle(
                        color: isSelected ? Colors.white : (textColor ?? Colors.black87),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (showBadge && badgeText != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: badgeColor ?? Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badgeText!,
                      style: TextStyle(
                        color: badgeTextColor ?? Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                if (deleteIcon != null)
                  deleteIcon!,
              ],
            ),
          ),
        ),
      ),
    );
    
    if (animated) {
      chip = AnimatedContainer(
        duration: animationDuration,
        curve: animationCurve,
        child: chip,
      );
    }
    
    return chip;
  }
}

class ActionChip extends StatelessWidget {
  final String label;
  final Widget? avatar;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledColor;
  final Color? selectedColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? labelStyle;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? splashColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? elevation;
  final bool pressElevation;
  final Color? pressColor;
  final bool enableFeedback;
  final bool showIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool animated;
  final Duration animationDuration;
  final Curve animationCurve;
  
  const InputChip({
    super.key,
    required this.label,
    this.onDelete,
    this.onSelected,
    this.selected = false,
    this.selectedColor,
    this.backgroundColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomChip(
      label: label,
      selected: selected,
      onTap: onSelected,
      onDelete: onDelete,
      deletable: onDelete != null,
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
    );
  }
}
