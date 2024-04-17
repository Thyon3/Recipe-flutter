import 'package:flutter/material.dart';
import '../constants.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Color? color;
  final bool interactive;
  final Function(double)? onRatingChanged;
  
  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 20,
    this.color,
    this.interactive = false,
    this.onRatingChanged,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return _buildStar(index);
      }),
    );
  }
  
  Widget _buildStar(int index) {
    final starValue = index + 1;
    final filled = rating >= starValue;
    final halfFilled = rating > index && rating < starValue;
    
    Widget star;
    
    if (halfFilled) {
      star = Icon(
        Icons.star_half,
        color: color ?? Colors.amber,
        size: size,
      );
    } else if (filled) {
      star = Icon(
        Icons.star,
        color: color ?? Colors.amber,
        size: size,
      );
    } else {
      star = Icon(
        Icons.star_border,
        color: color ?? Colors.amber,
        size: size,
      );
    }
    
    if (interactive && onRatingChanged != null) {
      return GestureDetector(
        onTap: () => onRatingChanged!(starValue.toDouble()),
        child: star,
      );
    }
    
    return star;
  }
}

class InteractiveRatingWidget extends StatefulWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Color? color;
  final Function(double)? onRatingChanged;
  
  const InteractiveRatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 24,
    this.color,
    this.onRatingChanged,
  });
  
  @override
  State<InteractiveRatingWidget> createState() => _InteractiveRatingWidgetState();
}

class _InteractiveRatingWidgetState extends State<InteractiveRatingWidget> {
  late double _currentRating;
  
  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }
  
  @override
  Widget build(BuildContext context) {
    return RatingWidget(
      rating: _currentRating,
      maxRating: widget.maxRating,
      size: widget.size,
      color: widget.color,
      interactive: true,
      onRatingChanged: (newRating) {
        setState(() {
          _currentRating = newRating;
        });
        widget.onRatingChanged?.call(newRating);
      },
    );
  }
}
