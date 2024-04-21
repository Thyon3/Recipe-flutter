import 'package:flutter/material.dart';
import '../constants.dart';

class RatingWidget extends StatefulWidget {
  final double rating;
  final int maxRating;
  final Function(double)? onRatingChanged;
  final double size;
  final Color? color;
  final bool isInteractive;
  final bool showHalfStars;
  final bool showRatingValue;
  final String? ratingText;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment alignment;
  
  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.onRatingChanged,
    this.size = 24.0,
    this.color,
    this.isInteractive = true,
    this.showHalfStars = true,
    this.showRatingValue = false,
    this.ratingText,
    this.padding,
    this.alignment = MainAxisAlignment.center,
  });
  
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late double _rating;
  
  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: widget.alignment,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.maxRating, (index) {
              return _buildStar(index);
            }),
          ),
          if (widget.showRatingValue) ...[
            const SizedBox(width: 8),
            Text(
              widget.ratingText ?? '${_rating.toStringAsFixed(1)}/${widget.maxRating}',
              style: TextStyle(
                fontSize: widget.size * 0.6,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildStar(int index) {
    final starValue = index + 1.0;
    final halfStarValue = index + 0.5;
    bool isFilled = false;
    bool isHalfFilled = false;
    
    if (widget.showHalfStars) {
      if (_rating >= starValue) {
        isFilled = true;
      } else if (_rating >= halfStarValue) {
        isHalfFilled = true;
      }
    } else {
      isFilled = _rating >= starValue;
    }
    
    return GestureDetector(
      onTap: widget.isInteractive ? () {
        setState(() {
          _rating = starValue.toDouble();
          widget.onRatingChanged?.call(_rating);
        });
      } : null,
      onTapDown: widget.isInteractive && widget.showHalfStars ? (details) {
        final localDx = details.localPosition.dx;
        final starWidth = widget.size;
        final isHalf = localDx < starWidth / 2;
        final newRating = isHalf ? halfStarValue : starValue;
        
        setState(() {
          _rating = newRating;
          widget.onRatingChanged?.call(_rating);
        });
      } : null,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            Icon(
              Icons.star_border,
              size: widget.size,
              color: widget.color ?? Colors.grey[300],
            ),
            if (isFilled)
              Icon(
                Icons.star,
                size: widget.size,
                color: widget.color ?? Colors.amber,
              ),
            if (isHalfFilled)
              ClipRect(
                clipper: HalfClipper(
                  clipWidth: widget.size / 2,
                ),
                child: Icon(
                  Icons.star,
                  size: widget.size,
                  color: widget.color ?? Colors.amber,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class HalfClipper extends CustomClipper<Rect> {
  final double clipWidth;
  
  HalfClipper({required this.clipWidth});
  
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, clipWidth, size.height);
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return oldClipper is HalfClipper && oldClipper.clipWidth != clipWidth;
  }
}

class ReadOnlyRatingWidget extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Color? color;
  final bool showHalfStars;
  final bool showRatingValue;
  final String? ratingText;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment alignment;
  
  const ReadOnlyRatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 24.0,
    this.color,
    this.showHalfStars = true,
    this.showRatingValue = false,
    this.ratingText,
    this.padding,
    this.alignment = MainAxisAlignment.center,
  });
  
  @override
  Widget build(BuildContext context) {
    return RatingWidget(
      rating: rating,
      maxRating: maxRating,
      size: size,
      color: color,
      isInteractive: false,
      showHalfStars: showHalfStars,
      showRatingValue: showRatingValue,
      ratingText: ratingText,
      padding: padding,
      alignment: alignment,
    );
  }
}
