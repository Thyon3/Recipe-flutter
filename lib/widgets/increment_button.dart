import 'package:flutter/material.dart';
import '../constants.dart';
import '../utils.dart';

class IncrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool showIcon;
  
  const IncrementButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.icon,
    this.showIcon = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: _buildIcon(),
      label: Text(
        label ?? 'Increment',
        style: TextStyle(
          fontSize: showIcon ? 14 : 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppConstants.primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: height != null ? (height! - 24) / 2 : 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        minimumSize: Size(width ?? 120, height ?? AppConstants.buttonHeight),
      ),
    );
  }
  
  Widget _buildIcon() {
    if (!showIcon) return const SizedBox.shrink();
    
    if (isLoading) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      );
    }
    
    return Icon(
      icon ?? Icons.add,
      size: 20,
    );
  }
}

class DecrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool showIcon;
  
  const DecrementButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.icon,
    this.showIcon = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: _buildIcon(),
      label: Text(
        label ?? 'Decrement',
        style: TextStyle(
          fontSize: showIcon ? 14 : 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.orange,
        foregroundColor: foregroundColor ?? Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: height != null ? (height! - 24) / 2 : 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        minimumSize: Size(width ?? 120, height ?? AppConstants.buttonHeight),
      ),
    );
  }
  
  Widget _buildIcon() {
    if (!showIcon) return const SizedBox.shrink();
    
    if (isLoading) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      );
    }
    
    return Icon(
      icon ?? Icons.remove,
      size: 20,
    );
  }
}
