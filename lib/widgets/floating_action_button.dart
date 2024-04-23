import 'package:flutter/material.dart';
import '../constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isExtended;
  final String? label;
  
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.isExtended = false,
    this.label,
  });
  
  @override
  Widget build(BuildContext context) {
    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label!),
        tooltip: tooltip,
        backgroundColor: backgroundColor ?? AppConstants.primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      );
    }
    
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: backgroundColor ?? AppConstants.primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Icon(icon),
    );
  }
}

class SpeedDialFab extends StatefulWidget {
  final List<SpeedDialItem> items;
  final IconData mainIcon;
  final String? mainTooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  
  const SpeedDialFab({
    super.key,
    required this.items,
    required this.mainIcon,
    this.mainTooltip,
    this.backgroundColor,
    this.foregroundColor,
  });
  
  @override
  State<SpeedDialFab> createState() => _SpeedDialFabState();
}

class _SpeedDialFabState extends State<SpeedDialFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isOpen = false;
  
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
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...widget.items.map((item) {
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -_animation.value * 60 * (widget.items.indexOf(item) + 1)),
                child: Opacity(
                  opacity: _animation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FloatingActionButton(
                      onPressed: () {
                        item.onPressed();
                        _toggle();
                      },
                      tooltip: item.tooltip,
                      backgroundColor: item.backgroundColor ?? Colors.white,
                      foregroundColor: item.foregroundColor ?? Colors.black,
                      mini: true,
                      child: Icon(item.icon),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
        FloatingActionButton(
          onPressed: _toggle,
          tooltip: widget.mainTooltip,
          backgroundColor: widget.backgroundColor ?? AppConstants.primaryColor,
          foregroundColor: widget.foregroundColor ?? Colors.white,
          child: AnimatedRotation(
            turns: _isOpen ? 0.5 : 0,
            duration: AppConstants.animationDuration,
            child: Icon(widget.mainIcon),
          ),
        ),
      ],
    );
  }
}

class SpeedDialItem {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  
  SpeedDialItem({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });
}
