import 'package:flutter/material.dart';
import 'dart:async';
import '../constants.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final double? size;
  final Color? color;
  final double? strokeWidth;
  final String? loadingText;
  final bool showPercentage;
  final double? progress;
  
  const LoadingWidget({
    super.key,
    this.message,
    this.size,
    this.color,
    this.strokeWidth,
    this.loadingText,
    this.showPercentage = false,
    this.progress,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size ?? 40,
            height: size ?? 40,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 3,
              value: showPercentage ? progress : null,
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? AppConstants.primaryColor,
              ),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (loadingText != null) ...[
            const SizedBox(height: 8),
            Text(
              loadingText!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
          ],
          if (showPercentage && progress != null) ...[
            const SizedBox(height: 8),
            Text(
              '${(progress! * 100).toInt()}%',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String? loadingMessage;
  final double? size;
  final Color? overlayColor;
  final bool dismissible;
  
  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.loadingMessage,
    this.size,
    this.overlayColor,
    this.dismissible = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          GestureDetector(
            onTap: dismissible ? null : () {},
            child: Container(
              color: overlayColor ?? Colors.black.withOpacity(0.5),
              child: LoadingWidget(
                message: loadingMessage ?? 'Loading...',
                size: size ?? 50,
              ),
            ),
          ),
      ],
    );
  }
}

class PulsingLoadingWidget extends StatefulWidget {
  final String? message;
  final double? size;
  final Color? color;
  
  const PulsingLoadingWidget({
    super.key,
    this.message,
    this.size,
    this.color,
  });
  
  @override
  State<PulsingLoadingWidget> createState() => _PulsingLoadingWidgetState();
}

class _PulsingLoadingWidgetState extends State<PulsingLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.repeat();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + (_animation.value * 0.2),
          child: Opacity(
            opacity: 0.6 + (_animation.value * 0.4),
            child: LoadingWidget(
              message: widget.message,
              size: widget.size,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class ProgressLoadingWidget extends StatefulWidget {
  final String? message;
  final double? size;
  final Color? color;
  final Duration duration;
  final int totalSteps;
  final Function(int)? onStepComplete;
  
  const ProgressLoadingWidget({
    super.key,
    this.message,
    this.size,
    this.color,
    this.duration = const Duration(seconds: 3),
    this.totalSteps = 3,
    this.onStepComplete,
  });
  
  @override
  State<ProgressLoadingWidget> createState() => _ProgressLoadingWidgetState();
}

class _ProgressLoadingWidgetState extends State<ProgressLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentStep = 0;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(_onAnimationUpdate);
    _controller.forward();
  }
  
  void _onAnimationUpdate() {
    final step = (_animation.value * widget.totalSteps).floor();
    if (step != _currentStep && step < widget.totalSteps) {
      setState(() {
        _currentStep = step;
        widget.onStepComplete?.call(step);
      });
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.size ?? 40,
          height: widget.size ?? 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppConstants.primaryColor,
            ),
          ),
        ),
        if (widget.message != null) ...[
          const SizedBox(height: 16),
          Text(
            widget.message!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 8),
        Text(
          'Step ${_currentStep + 1} of ${widget.totalSteps}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
