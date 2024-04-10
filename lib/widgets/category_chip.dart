import 'package:flutter/material.dart';
import '../constants.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;
  final Color? selectedColor;
  final Color? textColor;
  final Color? selectedTextColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final bool animated;
  
  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.color,
    this.selectedColor,
    this.textColor,
    this.selectedTextColor,
    this.fontSize,
    this.padding,
    this.animated = true,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget chip = Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? (selectedColor ?? AppConstants.primaryColor)
            : (color ?? Colors.grey[200]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? (selectedColor ?? AppConstants.primaryColor)
              : (color ?? Colors.grey[300]!),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected 
              ? (selectedTextColor ?? Colors.white)
              : (textColor ?? Colors.black87),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
    
    if (animated) {
      chip = AnimatedContainer(
        duration: AppConstants.animationDuration,
        curve: Curves.easeInOut,
        child: chip,
      );
    }
    
    return GestureDetector(
      onTap: onTap,
      child: chip,
    );
  }
}
