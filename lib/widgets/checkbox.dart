import 'package:flutter/material.dart';
import '../constants.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final double? size;
  final double? borderRadius;
  final bool disabled;
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  
  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.size,
    this.borderRadius,
    this.disabled = false,
    this.label,
    this.labelStyle,
    this.contentPadding,
  });
  
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _checkAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    if (widget.value) {
      _controller.value = 1.0;
    }
  }
  
  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final checkbox = GestureDetector(
      onTap: widget.disabled ? null : () {
        widget.onChanged?.call(!widget.value);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value * 0.2 + 0.8,
            child: Container(
              width: widget.size ?? 24,
              height: widget.size ?? 24,
              decoration: BoxDecoration(
                color: widget.value
                    ? (widget.activeColor ?? AppConstants.primaryColor)
                    : Colors.transparent,
                border: Border.all(
                  color: widget.borderColor ?? 
                      (widget.activeColor ?? AppConstants.primaryColor),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 4,
                ),
              ),
              child: Center(
                child: AnimatedBuilder(
                  animation: _checkAnimation,
                  builder: (context, child) {
                    return ClipRect(
                      clipper: _CheckClipper(
                        progress: _checkAnimation.value,
                      ),
                      child: Icon(
                        Icons.check,
                        size: (widget.size ?? 24) * 0.7,
                        color: widget.checkColor ?? Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
    
    if (widget.label != null) {
      return Padding(
        padding: widget.contentPadding ?? EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkbox,
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.label!,
                style: widget.labelStyle ??
                    TextStyle(
                      fontSize: 16,
                      color: widget.disabled ? Colors.grey[400] : Colors.black87,
                    ),
              ),
            ),
          ],
        ),
      );
    }
    
    return checkbox;
  }
}

class _CheckClipper extends CustomClipper<Rect> {
  final double progress;
  
  _CheckClipper({required this.progress});
  
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(
      0,
      size.height * (1 - progress),
      size.width,
      size.height * progress,
    );
  }
  
  @override
  bool shouldReclip(_CheckClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}

class CheckboxGroup extends StatefulWidget {
  final List<CheckboxItem> items;
  final List<bool> values;
  final ValueChanged<int>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final double? size;
  final bool disabled;
  final CrossAxisAlignment alignment;
  final EdgeInsetsGeometry? padding;
  
  const CheckboxGroup({
    super.key,
    required this.items,
    required this.values,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.size,
    this.disabled = false,
    this.alignment = CrossAxisAlignment.start,
    this.padding,
  });
  
  @override
  State<CheckboxGroup> createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: widget.alignment,
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final value = index < widget.values.length ? widget.values[index] : false;
          
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: CustomCheckbox(
              value: value,
              onChanged: widget.disabled ? null : (newValue) {
                widget.onChanged?.call(index);
              },
              activeColor: widget.activeColor,
              checkColor: widget.checkColor,
              borderColor: widget.borderColor,
              size: widget.size,
              disabled: widget.disabled,
              label: item.label,
              labelStyle: item.labelStyle,
            ),
          );
        }),
      ),
    );
  }
}

class CheckboxItem {
  final String label;
  final TextStyle? labelStyle;
  
  const CheckboxItem({
    required this.label,
    this.labelStyle,
  });
}
