import 'package:flutter/material.dart';
import '../constants.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final double? size;
  final Color? color;
  final double? strokeWidth;
  final String? loadingText;
  
  const LoadingWidget({
    super.key,
    this.message,
    this.size,
    this.color,
    this.strokeWidth,
    this.loadingText,
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
