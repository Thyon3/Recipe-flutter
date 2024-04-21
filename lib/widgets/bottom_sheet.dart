import 'package:flutter/material.dart';
import '../constants.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final double? height;
  final bool isScrollControlled;
  final bool isDismissible;
  final bool enableDrag;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxShadow? boxShadow;
  final VoidCallback? onDismissed;
  
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.height,
    this.isScrollControlled = false,
    this.isDismissible = true,
    this.enableDrag = true,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.boxShadow,
    this.onDismissed,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius ?? AppConstants.borderRadius),
        ),
        boxShadow: boxShadow ?? [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
        child: child,
      ),
    );
  }
}

class DraggableBottomSheet extends StatefulWidget {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  final double initialHeight;
  final bool isScrollControlled;
  final bool isDismissible;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Function(double)? onHeightChanged;
  final VoidCallback? onDismissed;
  
  const DraggableBottomSheet({
    super.key,
    required this.child,
    this.minHeight = 100,
    this.maxHeight = 500,
    this.initialHeight = 300,
    this.isScrollControlled = false,
    this.isDismissible = true,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.onHeightChanged,
    this.onDismissed,
  });
  
  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet>
    with SingleTickerProviderStateMixin {
  late double _currentHeight;
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight;
    _controller = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _currentHeight = (_currentHeight - details.delta.dy)
              .clamp(widget.minHeight, widget.maxHeight);
        });
        widget.onHeightChanged?.call(_currentHeight);
      },
      onPanEnd: (details) {
        final velocity = details.velocity.pixelsPerSecond.dy;
        if (velocity > 500) {
          _dismissSheet();
        } else if (velocity < -500) {
          _expandSheet();
        } else {
          _snapToNearest();
        }
      },
      child: Container(
        height: _currentHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(widget.borderRadius ?? AppConstants.borderRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildDragHandle(),
            Expanded(
              child: Padding(
                padding: widget.padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDragHandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
  
  void _dismissSheet() {
    if (widget.isDismissible) {
      _controller.forward().then((_) {
        widget.onDismissed?.call();
        Navigator.of(context).pop();
      });
    }
  }
  
  void _expandSheet() {
    setState(() {
      _currentHeight = widget.maxHeight;
    });
    widget.onHeightChanged?.call(_currentHeight);
  }
  
  void _snapToNearest() {
    final middleHeight = (widget.minHeight + widget.maxHeight) / 2;
    final targetHeight = _currentHeight < middleHeight ? widget.minHeight : widget.maxHeight;
    
    setState(() {
      _currentHeight = targetHeight;
    });
    widget.onHeightChanged?.call(_currentHeight);
  }
}

class ModalBottomSheetWrapper extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool showDragHandle;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  
  const ModalBottomSheetWrapper({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.showDragHandle = true,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
  });
  
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    List<Widget>? actions,
    bool showDragHandle = true,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    bool isScrollControlled = false,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => ModalBottomSheetWrapper(
        title: title,
        actions: actions,
        showDragHandle: showDragHandle,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        padding: padding,
        child: child,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius ?? AppConstants.borderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle) _buildDragHandle(),
          if (title != null) _buildHeader(),
          Padding(
            padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
            child: child,
          ),
        ],
      ),
    );
  }
  
  Widget _buildDragHandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
  
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
