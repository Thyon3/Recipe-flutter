import 'package:flutter/material.dart';
import '../constants.dart';

class CustomRadioButton<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? size;
  final bool disabled;
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  
  const CustomRadioButton({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.size,
    this.disabled = false,
    this.label,
    this.labelStyle,
    this.contentPadding,
  });
  
  @override
  State<CustomRadioButton<T>> createState() => _CustomRadioButtonState<T>();
}

class _CustomRadioButtonState<T> extends State<CustomRadioButton<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _innerCircleAnimation;
  
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
    _innerCircleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    if (widget.value == widget.groupValue) {
      _controller.value = 1.0;
    }
  }
  
  @override
  void didUpdateWidget(CustomRadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.groupValue != widget.groupValue) {
      if (widget.value == widget.groupValue) {
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
    final isSelected = widget.value == widget.groupValue;
    
    final radio = GestureDetector(
      onTap: widget.disabled ? null : () {
        widget.onChanged?.call(widget.value);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value * 0.2 + 0.8,
            child: Container(
              width: widget.size ?? 20,
              height: widget.size ?? 20,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? (widget.activeColor ?? AppConstants.primaryColor)
                      : (widget.inactiveColor ?? Colors.grey[400]!),
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: AnimatedBuilder(
                  animation: _innerCircleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _innerCircleAnimation.value,
                      child: Container(
                        width: (widget.size ?? 20) * 0.5,
                        height: (widget.size ?? 20) * 0.5,
                        decoration: BoxDecoration(
                          color: widget.activeColor ?? AppConstants.primaryColor,
                          shape: BoxShape.circle,
                        ),
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
            radio,
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
    
    return radio;
  }
}

class RadioButtonGroup<T> extends StatefulWidget {
  final List<RadioItem<T>> items;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? size;
  final bool disabled;
  final CrossAxisAlignment alignment;
  final EdgeInsetsGeometry? padding;
  final bool wrap;
  
  const RadioButtonGroup({
    super.key,
    required this.items,
    this.groupValue,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.size,
    this.disabled = false,
    this.alignment = CrossAxisAlignment.start,
    this.padding,
    this.wrap = false,
  });
  
  @override
  State<RadioButtonGroup<T>> createState() => _RadioButtonGroupState<T>();
}

class _RadioButtonGroupState<T> extends State<RadioButtonGroup<T>> {
  @override
  Widget build(BuildContext context) {
    final children = List.generate(widget.items.length, (index) {
      final item = widget.items[index];
      
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: CustomRadioButton<T>(
          value: item.value,
          groupValue: widget.groupValue,
          onChanged: widget.disabled ? null : widget.onChanged,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          size: widget.size,
          disabled: widget.disabled,
          label: item.label,
          labelStyle: item.labelStyle,
        ),
      );
    });
    
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: widget.wrap
          ? Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: children,
            )
          : Column(
              crossAxisAlignment: widget.alignment,
              children: children,
            ),
    );
  }
}

class RadioItem<T> {
  final T value;
  final String label;
  final TextStyle? labelStyle;
  
  const RadioItem({
    required this.value,
    required this.label,
    this.labelStyle,
  });
}
