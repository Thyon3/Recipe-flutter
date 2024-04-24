import 'package:flutter/material.dart';
import '../constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double? size;
  final bool mini;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final bool autofocus;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool isExtended;
  final Widget? label;
  final Widget? icon;
  final EdgeInsetsGeometry? extendedPadding;
  final double? extendedIconLabelSpacing;

  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.size,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.isExtended = false,
    this.label,
    this.icon,
    this.extendedPadding,
    this.extendedIconLabelSpacing,
  });

  @override
  Widget build(BuildContext context) {
    if (isExtended) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: icon ?? const Icon(Icons.add),
        label: label ?? const Text('Add'),
        tooltip: tooltip,
        backgroundColor: backgroundColor ?? AppConstants.primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: elevation ?? 6.0,
        shape: shape,
        clipBehavior: clipBehavior,
        autofocus: autofocus,
        materialTapTargetSize: materialTapTargetSize,
        extendedPadding: extendedPadding,
        extendedIconLabelSpacing: extendedIconLabelSpacing,
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
      tooltip: tooltip,
      backgroundColor: backgroundColor ?? AppConstants.primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      elevation: elevation ?? 6.0,
      mini: mini,
      shape: shape,
      clipBehavior: clipBehavior,
      autofocus: autofocus,
      materialTapTargetSize: materialTapTargetSize,
    );
  }
}

class SpeedDialFab extends StatefulWidget {
  final List<SpeedDialChild> children;
  final Widget? icon;
  final Widget? activeIcon;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? activeBackgroundColor;
  final Color? activeForegroundColor;
  final double elevation;
  final double? size;
  final bool mini;
  final ShapeBorder? shape;
  final Curve curve;
  final Duration animationDuration;
  final bool openCloseDialOnValueChange;
  final bool renderOverlay;
  final Color? overlayColor;
  final double? overlayOpacity;
  final bool visible;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;
  final bool useRipple;
  final double? rippleColor;
  final double? heroTag;
  final bool closeManually;
  final double? spacing;
  final double? margin;
  final bool useRotationAnimation;
  final double? rotationAngle;
  final bool enableAnimation;
  final bool switchLabelPosition;

  const SpeedDialFab({
    super.key,
    required this.children,
    this.icon,
    this.activeIcon,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.activeBackgroundColor,
    this.activeForegroundColor,
    this.elevation = 6.0,
    this.size,
    this.mini = false,
    this.shape,
    this.curve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 200),
    this.openCloseDialOnValueChange = false,
    this.renderOverlay = true,
    this.overlayColor,
    this.overlayOpacity,
    this.visible = true,
    this.onOpen,
    this.onClose,
    this.useRipple = true,
    this.rippleColor,
    this.heroTag,
    this.closeManually = false,
    this.spacing,
    this.margin,
    this.useRotationAnimation = true,
    this.rotationAngle = 45.0,
    this.enableAnimation = true,
    this.switchLabelPosition = false,
  });

  @override
  State<SpeedDialFab> createState() => _SpeedDialFabState();
}

class _SpeedDialFabState extends State<SpeedDialFab> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _rotateAnimation = Tween<double>(begin: 0.0, end: widget.rotationAngle).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (widget.renderOverlay)
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _isOpen ? (widget.overlayOpacity ?? 0.8) : 0.0,
                child: Container(
                  color: widget.overlayColor ?? Colors.black,
                ),
              );
            },
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...widget.children.map((child) => _buildSpeedDialChild(child)),
            const SizedBox(height: widget.spacing ?? 16),
            _buildMainFab(),
          ],
        ),
      ],
    );
  }

  Widget _buildMainFab() {
    return Transform.rotate(
      angle: widget.useRotationAnimation ? _rotateAnimation.value * 0.0174533 : 0.0,
      child: FloatingActionButton(
        onPressed: _toggle,
        tooltip: widget.tooltip,
        backgroundColor: _isOpen
            ? (widget.activeBackgroundColor ?? Colors.red)
            : (widget.backgroundColor ?? AppConstants.primaryColor),
        foregroundColor: _isOpen
            ? (widget.activeForegroundColor ?? Colors.white)
            : (widget.foregroundColor ?? Colors.white),
        elevation: widget.elevation,
        mini: widget.mini,
        shape: widget.shape,
        child: _isOpen
            ? (widget.activeIcon ?? const Icon(Icons.close))
            : (widget.icon ?? const Icon(Icons.add)),
      ),
    );
  }

  Widget _buildSpeedDialChild(SpeedDialChild child) {
    return AnimatedBuilder(
      animation: _expandAnimation,
      builder: (context, childWidget) {
        return Transform.translate(
          offset: Offset(
            0.0,
            _expandAnimation.value * -(widget.children.indexOf(child) + 1) * 56.0,
          ),
          child: Opacity(
            opacity: _expandAnimation.value,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (child.label != null)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        child.label!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  FloatingActionButton(
                    onPressed: child.onTap,
                    tooltip: child.tooltip,
                    backgroundColor: child.backgroundColor ?? AppConstants.primaryColor,
                    foregroundColor: child.foregroundColor ?? Colors.white,
                    elevation: child.elevation ?? 4.0,
                    mini: true,
                    heroTag: child.heroTag,
                    child: child.child,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
        widget.onOpen?.call();
      } else {
        _controller.reverse();
        widget.onClose?.call();
      }
    });
  }
}

class SpeedDialChild {
  final Widget child;
  final VoidCallback onTap;
  final String? label;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final Object? heroTag;

  SpeedDialChild({
    required this.child,
    required this.onTap,
    this.label,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.heroTag,
  });
}
