import 'package:flutter/material.dart';
import '../constants.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;
  
  const CustomDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  });
  
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness ?? 1,
      color: color ?? Colors.grey[300],
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class VerticalDivider extends StatelessWidget {
  final double? width;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;
  
  const VerticalDivider({
    super.key,
    this.width,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1,
      height: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: indent ?? 0,
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(
          (thickness ?? 1) / 2,
        ),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final double dashWidth;
  final double dashSpace;
  final double? indent;
  final double? endIndent;
  
  const DashedDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.dashWidth = 8,
    this.dashSpace = 4,
    this.indent,
    this.endIndent,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: indent ?? 0,
      ),
      child: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _generateDashedLine(constraints.maxWidth),
                );
              },
            ),
          ),
          if (endIndent != null) SizedBox(width: endIndent!),
        ],
      ),
    );
  }
  
  List<Widget> _generateDashedLine(double width) {
    final List<Widget> dashes = [];
    final int dashCount = (width / (dashWidth + dashSpace)).floor();
    
    for (int i = 0; i < dashCount; i++) {
      dashes.add(
        Container(
          width: dashWidth,
          height: thickness ?? 1,
          color: color ?? Colors.grey[300],
        ),
      );
      if (i < dashCount - 1) {
        dashes.add(SizedBox(width: dashSpace));
      }
    }
    
    return dashes;
  }
}

class SectionDivider extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? thickness;
  
  const SectionDivider({
    super.key,
    required this.title,
    this.trailing,
    this.padding,
    this.color,
    this.thickness,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomDivider(
              thickness: thickness,
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: TextStyle(
                color: color ?? Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          if (trailing != null) ...[
            trailing!,
            const SizedBox(width: 16),
          ],
          Expanded(
            child: CustomDivider(
              thickness: thickness,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
