import 'package:flutter/material.dart';
import '../constants.dart';
import 'loading_widget.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Duration timeout;
  final bool showLoading;
  final bool enableCache;
  final String? cacheKey;
  final VoidCallback? onTap;
  final VoidCallback? onError;
  
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.timeout = const Duration(seconds: 10),
    this.showLoading = true,
    this.enableCache = false,
    this.cacheKey,
    this.onTap,
    this.onError,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          color: Colors.grey[200],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          child: Image.network(
            imageUrl: imageUrl,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (!showLoading) return child;
              return Center(
                child: LoadingWidget(
                  size: 30,
                  message: 'Loading...',
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              if (onError != null) {
                onError();
              }
              debugPrint('Error loading image: $error');
              return errorWidget ?? _buildDefaultError();
            },
            frameBuilder: (context, child, frame) {
              if (frame != null) {
                return child;
              }
              return _buildDefaultPlaceholder();
            },
          ),
        ),
      ),
    );
  }
  
  Widget _buildDefaultPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.broken_image,
              size: 40,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Loading image...',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDefaultError() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 40,
              color: Colors.red[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Failed to load image',
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap to retry',
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 10,
                decoration: TextDecoration(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String? cacheKey;
  final Duration timeout;
  final VoidCallback? onTap;
  final VoidCallback? onError;
  
  const CachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.cacheKey,
    this.timeout = const Duration(seconds: 10),
    this.onTap,
    this.onError,
  });
  
  @override
  State<CachedNetworkImage> createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage> {
  ImageProvider? _imageProvider;
  
  @override
  void initState() {
    super.initState();
    _loadImage();
  }
  
  void _loadImage() {
    if (widget.cacheKey != null) {
      // In a real app, you would use cached_network_image package
      // For demo purposes, we'll just load normally
    }
    
    _imageProvider = NetworkImage(
      imageUrl: widget.imageUrl,
    );
    
    if (widget.imageUrl.isNotEmpty) {
      precacheImage(widget.imageUrl);
    }
  }
  
  void precacheImage(String url) {
    // In a real app, you would use the cached_network_image package
    // This is just a placeholder for demonstration
    debugPrint('Precaching image: $url');
  }
  
  @override
  void dispose() {
    _imageProvider?.evict();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Image(
      image: _imageProvider,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      frameBuilder: (context, child, frame) {
        if (frame != null) {
          return child;
        }
        return widget.placeholder ?? _buildDefaultPlaceholder();
      },
      errorBuilder: (context, error, stackTrace) {
        if (widget.onError != null) {
          widget.onError!();
        }
        debugPrint('Error loading image: $error');
        return widget.errorWidget ?? _buildDefaultError();
      },
      loadingBuilder: (context, child, loadingProgress) {
        return widget.placeholder ?? _buildDefaultPlaceholder();
      },
    );
  }
  
  Widget _buildDefaultPlaceholder() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: 40,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Loading image...',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDefaultError() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 40,
              color: Colors.red[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Failed to load image',
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap to retry',
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 10,
                decoration: TextDecoration(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
