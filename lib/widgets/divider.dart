import 'package:flutter/material.dart';
import '../constants.dart';
import 'dart:math';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final EdgeInsetsGeometry? indent;
  final EdgeInsetsGeometry? endIndent;
  final bool showDots;
  final double? dotSize;
  final double? dotSpacing;
  final bool showGradient;
  final Gradient? gradient;
  final bool showDashed;
  final double? dashWidth;
  final double? dashSpacing;
  final bool showWavy;
  final double? waveAmplitude;
  final double? waveFrequency;
  final bool showAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showGlow;
  final Color? glowColor;
  final double? glowBlurRadius;
  final bool showLeftCap;
  final bool showRightCap;
  final double? capRadius;
  final Color? capColor;
  final bool showText;
  final String? text;
  final TextStyle? textStyle;
  final Color? textColor;
  final bool textCentered;
  final bool showIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showLeftContent;
  final Widget? leftContent;
  final bool showRightContent;
  final Widget? rightContent;
  final double? contentSpacing;
  final bool showBackground;
  final Color? backgroundColor;
  final double? borderRadius;
  
  const CustomDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
    this.showDots = false,
    this.dotSize,
    this.dotSpacing,
    this.showGradient = false,
    this.gradient,
    this.showDashed = false,
    this.dashWidth,
    this.dashSpacing,
    this.showWavy = false,
    this.waveAmplitude,
    this.waveFrequency,
    this.showAnimated = false,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.showGlow = false,
    this.glowColor,
    this.glowBlurRadius,
    this.showLeftCap = false,
    this.showRightCap = false,
    this.capRadius,
    this.capColor,
    this.showText = false,
    this.text,
    this.textStyle,
    this.textColor,
    this.textCentered = false,
    this.showIcon = false,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.showLeftContent = false,
    this.leftContent,
    this.showRightContent = false,
    this.rightContent,
    this.contentSpacing,
    this.showBackground = false,
    this.backgroundColor,
    this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget divider = _buildDivider();
    
    if (showAnimated) {
      divider = TweenAnimationBuilder<double>(
        duration: animationDuration,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: animationCurve,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.scale(
              scaleX: value,
              child: divider,
            ),
          );
        },
      );
    }
    
    if (showBackground) {
      divider = Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: divider,
      );
    }
    
    return divider;
  }
  
  Widget _buildDivider() {
    if (showDots) {
      return _buildDottedDivider();
    } else if (showDashed) {
      return _buildDashedDivider();
    } else if (showWavy) {
      return _buildWavyDivider();
    } else if (showGradient) {
      return _buildGradientDivider();
    } else {
      return _buildSolidDivider();
    }
  }
  
  Widget _buildSolidDivider() {
    Widget divider = Container(
      height: height ?? 1.0,
      color: color ?? Colors.grey[300],
    );
    
    if (showGlow) {
      divider = Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: glowColor ?? Colors.grey.withOpacity(0.5),
              blurRadius: glowBlurRadius ?? 4.0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: divider,
      );
    }
    
    return Container(
      height: height ?? 1.0,
      margin: indent,
      child: Container(
        margin: endIndent,
        child: Row(
          children: [
            if (showLeftCap) _buildCap(true),
            Expanded(
              child: Container(
                color: color ?? Colors.grey[300],
                height: thickness ?? 1.0,
                child: divider,
              ),
            ),
            if (showRightCap) _buildCap(false),
          ],
        ),
      ),
    );
  }
  
  Widget _buildGradientDivider() {
    return Container(
      height: height ?? 1.0,
      decoration: BoxDecoration(
        gradient: gradient ?? LinearGradient(
          colors: [
            Colors.transparent,
            color ?? Colors.grey[300],
            Colors.transparent,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
  
  Widget _buildDottedDivider() {
    return Container(
      height: height ?? 1.0,
      margin: indent,
      child: Container(
        margin: endIndent,
        child: Row(
          children: [
            if (showLeftCap) _buildCap(true),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  50,
                  (index) => Container(
                    width: dotSize ?? 2.0,
                    height: thickness ?? 2.0,
                    decoration: BoxDecoration(
                      color: color ?? Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            if (showRightCap) _buildCap(false),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDashedDivider() {
    return Container(
      height: height ?? 1.0,
      margin: indent,
      child: Container(
        margin: endIndent,
        child: Row(
          children: [
            if (showLeftCap) _buildCap(true),
            Expanded(
              child: Row(
                children: List.generate(
                  20,
                  (index) => Container(
                    width: dashWidth ?? 8.0,
                    height: thickness ?? 1.0,
                    color: color ?? Colors.grey[300],
                    margin: EdgeInsets.only(right: dashSpacing ?? 4.0),
                  ),
                ),
              ),
            ),
            if (showRightCap) _buildCap(false),
          ],
        ),
      ),
    );
  }
  
  Widget _buildWavyDivider() {
    return Container(
      height: height ?? 20.0,
      margin: indent,
      child: Container(
        margin: endIndent,
        child: CustomPaint(
          painter: WavyLinePainter(
            color: color ?? Colors.grey[300],
            thickness: thickness ?? 1.0,
            amplitude: waveAmplitude ?? 5.0,
            frequency: waveFrequency ?? 20.0,
          ),
        ),
      ),
    );
  }
  
  Widget _buildCap(bool isLeft) {
    return Container(
      width: capRadius ?? 8.0,
      height: capRadius ?? 8.0,
      decoration: BoxDecoration(
        color: capColor ?? (color ?? Colors.grey[300]),
        shape: BoxShape.circle,
      ),
    );
  }
}

class WavyLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double amplitude;
  final double frequency;
  
  WavyLinePainter({
    required this.color,
    required this.thickness,
    required this.amplitude,
    required this.frequency,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;
    
    final path = Path();
    final step = size.width / frequency;
    
    for (double x = 0; x <= size.width; x += step) {
      final y = size.height / 2 + amplitude * math.sin(x * math.pi * 2 / size.width * frequency);
      
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TextDivider extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? dividerColor;
  final double? thickness;
  final EdgeInsetsGeometry? padding;
  final bool showVertical;
  final bool showLeftLine;
  final bool showRightLine;
  final double? lineLength;
  final bool centerText;
  final Widget? child;
  
  const TextDivider({
    super.key,
    required this.text,
    this.textStyle,
    this.textColor,
    this.dividerColor,
    this.thickness,
    this.padding,
    this.showVertical = false,
    this.showLeftLine = true,
    this.showRightLine = true,
    this.lineLength,
    this.centerText = true,
    this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget textWidget = child ?? Text(
      text,
      style: textStyle ?? TextStyle(
        color: textColor ?? Colors.grey[600],
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
    
    if (showVertical) {
      return Row(
        children: [
          if (showLeftLine)
            Container(
              width: thickness ?? 1.0,
              height: lineLength ?? 20,
              color: dividerColor ?? Colors.grey[300],
            ),
          if (centerText) ...[
            Container(
              width: padding?.horizontal ?? 16,
            ),
            textWidget,
            Container(
              width: padding?.horizontal ?? 16,
            ),
          ],
          if (showRightLine)
            Container(
              width: thickness ?? 1.0,
              height: lineLength ?? 20,
              color: dividerColor ?? Colors.grey[300],
            ),
        ],
      );
    }
    
    return Row(
      children: [
        if (showLeftLine)
          Container(
            width: lineLength ?? 30,
            height: thickness ?? 1.0,
            color: dividerColor ?? Colors.grey[300],
          ),
        if (centerText) ...[
          Container(
            width: padding?.horizontal ?? 16,
          ),
          textWidget,
          Container(
            width: padding?.horizontal ?? 16,
          ),
        ],
        if (showRightLine)
          Container(
            width: lineLength ?? 30,
            height: thickness ?? 1.0,
            color: dividerColor ?? Colors.grey[300],
          ),
      ],
    );
  }
}
