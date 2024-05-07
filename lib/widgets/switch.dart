import 'package:flutter/material.dart';
import '../constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final double? width;
  final double? height;
  final double? thumbRadius;
  final bool disabled;
  
  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.width,
    this.height,
    this.thumbRadius,
    this.disabled = false,
  });
  
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    if (widget.value) {
      _controller.value = 1.0;
    }
  }
  
  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
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
    return GestureDetector(
      onTap: widget.disabled ? null : () {
        widget.onChanged?.call(!widget.value);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width ?? 48,
            height: widget.height ?? 24,
            decoration: BoxDecoration(
              color: widget.value
                  ? (widget.activeColor ?? AppConstants.primaryColor)
                  : (widget.inactiveColor ?? Colors.grey[300]),
              borderRadius: BorderRadius.circular(
                (widget.height ?? 24) / 2,
              ),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: AppConstants.animationDuration,
                  curve: Curves.easeInOut,
                  left: widget.value
                      ? (widget.width ?? 48) - (widget.height ?? 24)
                      : 0,
                  top: 0,
                  child: Container(
                    width: widget.height ?? 24,
                    height: widget.height ?? 24,
                    decoration: BoxDecoration(
                      color: widget.value
                          ? (widget.activeThumbColor ?? Colors.white)
                          : (widget.inactiveThumbColor ?? Colors.white),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LabeledSwitch extends StatelessWidget {
  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final bool disabled;
  final Widget? leading;
  final Widget? trailing;
  
  const LabeledSwitch({
    super.key,
    required this.label,
    this.subtitle,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.disabled = false,
    this.leading,
    this.trailing,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: disabled ? Colors.grey[400] : Colors.black87,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 14,
                    color: disabled ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
              ],
            ],
          ),
        ),
        CustomSwitch(
          value: value,
          onChanged: disabled ? null : onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          disabled: disabled,
        ),
        if (trailing != null) ...[
          const SizedBox(width: 12),
          trailing!,
        ],
      ],
    );
  }
}

class ToggleSwitch extends StatefulWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? textColor;
  final double? height;
  final double? borderRadius;
  
  const ToggleSwitch({
    super.key,
    required this.options,
    required this.selectedIndex,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.textColor,
    this.height,
    this.borderRadius,
  });
  
  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _animations = List.generate(
      widget.options.length,
      (index) => CurvedAnimation(
        parent: _controller,
        curve: index == widget.selectedIndex
            ? Curves.easeInOut
            : Curves.easeInOut.flipped,
      ),
    );
    _controller.value = 1.0;
  }
  
  @override
  void didUpdateWidget(ToggleSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _controller.reset();
      _controller.forward();
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 40,
      decoration: BoxDecoration(
        color: widget.inactiveColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? 20,
        ),
      ),
      child: Row(
        children: List.generate(widget.options.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onChanged?.call(index);
              },
              child: AnimatedBuilder(
                animation: _animations[index],
                builder: (context, child) {
                  final isSelected = index == widget.selectedIndex;
                  return Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (widget.activeColor ?? AppConstants.primaryColor)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? 20,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.options[index],
                        style: TextStyle(
                          color: isSelected
                              ? (widget.textColor ?? Colors.white)
                              : (widget.textColor ?? Colors.black54),
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
