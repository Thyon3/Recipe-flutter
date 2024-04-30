import 'package:flutter/material.dart';
import '../constants.dart';

class CustomBadge extends StatelessWidget {
  final Widget child;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final bool showBadge;
  final BadgePosition position;
  
  const CustomBadge({
    super.key,
    required this.child,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.showBadge = true,
    this.position = BadgePosition.topRight,
  });
  
  @override
  Widget build(BuildContext context) {
    if (!showBadge || label.isEmpty) {
      return child;
    }
    
    return Badge(
      label: Text(
        label,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: backgroundColor ?? AppConstants.primaryColor,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      alignment: position.alignment,
      child: child,
    );
  }
}

class NotificationBadge extends StatelessWidget {
  final Widget child;
  final int count;
  final Color? backgroundColor;
  final Color? textColor;
  final bool showBadge;
  final BadgePosition position;
  final bool showZero;
  
  const NotificationBadge({
    super.key,
    required this.child,
    required this.count,
    this.backgroundColor,
    this.textColor,
    this.showBadge = true,
    this.position = BadgePosition.topRight,
    this.showZero = false,
  });
  
  @override
  Widget build(BuildContext context) {
    if (!showBadge || (count == 0 && !showZero)) {
      return child;
    }
    
    final displayCount = count > 99 ? '99+' : count.toString();
    
    return CustomBadge(
      child: child,
      label: displayCount,
      backgroundColor: backgroundColor ?? Colors.red,
      textColor: textColor,
      position: position,
    );
  }
}

class DotBadge extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? size;
  final bool showBadge;
  final BadgePosition position;
  
  const DotBadge({
    super.key,
    required this.child,
    this.color,
    this.size,
    this.showBadge = true,
    this.position = BadgePosition.topRight,
  });
  
  @override
  Widget build(BuildContext context) {
    if (!showBadge) {
      return child;
    }
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: position.top,
          right: position.right,
          bottom: position.bottom,
          left: position.left,
          child: Container(
            width: size ?? 8,
            height: size ?? 8,
            decoration: BoxDecoration(
              color: color ?? Colors.red,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum BadgePosition {
  topRight(top: -4, right: -4, bottom: null, left: null),
  topLeft(top: -4, right: null, bottom: null, left: -4),
  bottomRight(top: null, right: -4, bottom: -4, left: null),
  bottomLeft(top: null, right: null, bottom: -4, left: -4),
  center(top: 0, right: 0, bottom: 0, left: 0);
  
  const BadgePosition({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
  
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  
  Alignment get alignment {
    switch (this) {
      case BadgePosition.topRight:
        return Alignment.topRight;
      case BadgePosition.topLeft:
        return Alignment.topLeft;
      case BadgePosition.bottomRight:
        return Alignment.bottomRight;
      case BadgePosition.bottomLeft:
        return Alignment.bottomLeft;
      case BadgePosition.center:
        return Alignment.center;
    }
  }
}
