import 'package:flutter/material.dart';
import '../constants.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double? thumbRadius;
  final bool disabled;
  final String? label;
  final bool showLabels;
  final bool showValue;
  
  const CustomSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.thumbRadius,
    this.disabled = false,
    this.label,
    this.showLabels = false,
    this.showValue = true,
  });
  
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double _currentValue;
  
  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }
  
  @override
  void didUpdateWidget(CustomSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _currentValue = widget.value;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: widget.activeColor ?? AppConstants.primaryColor,
            inactiveTrackColor: widget.inactiveColor ?? Colors.grey[300],
            thumbColor: widget.thumbColor ?? AppConstants.primaryColor,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: widget.thumbRadius ?? 12,
            ),
            overlayColor: (widget.activeColor ?? AppConstants.primaryColor).withOpacity(0.2),
            valueIndicatorColor: widget.activeColor ?? AppConstants.primaryColor,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          child: Slider(
            value: _currentValue,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.showValue ? _currentValue.toStringAsFixed(1) : null,
            onChanged: widget.disabled ? null : (value) {
              setState(() {
                _currentValue = value;
              });
              widget.onChanged?.call(value);
            },
            onChangeEnd: widget.onChangeEnd,
          ),
        ),
        if (widget.showLabels) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.min.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                widget.max.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class RangeSlider extends StatefulWidget {
  final RangeValues values;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double? thumbRadius;
  final bool disabled;
  final String? label;
  final bool showLabels;
  final bool showValues;
  
  const RangeSlider({
    super.key,
    required this.values,
    this.onChanged,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.thumbRadius,
    this.disabled = false,
    this.label,
    this.showLabels = false,
    this.showValues = true,
  });
  
  @override
  State<RangeSlider> createState() => _RangeSliderState();
}

class _RangeSliderState extends State<RangeSlider> {
  late RangeValues _currentValues;
  
  @override
  void initState() {
    super.initState();
    _currentValues = widget.values;
  }
  
  @override
  void didUpdateWidget(RangeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.values != widget.values) {
      _currentValues = widget.values;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: widget.activeColor ?? AppConstants.primaryColor,
            inactiveTrackColor: widget.inactiveColor ?? Colors.grey[300],
            thumbColor: widget.thumbColor ?? AppConstants.primaryColor,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: widget.thumbRadius ?? 12,
            ),
            overlayColor: (widget.activeColor ?? AppConstants.primaryColor).withOpacity(0.2),
            valueIndicatorColor: widget.activeColor ?? AppConstants.primaryColor,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 12,
            ),
          ),
          child: RangeSlider(
            values: _currentValues,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            labels: widget.showValues
                ? RangeLabels(
                    _currentValues.start.toStringAsFixed(1),
                    _currentValues.end.toStringAsFixed(1),
                  )
                : null,
            onChanged: widget.disabled ? null : (values) {
              setState(() {
                _currentValues = values;
              });
              widget.onChanged?.call(values);
            },
            onChangeEnd: widget.onChangeEnd,
          ),
        ),
        if (widget.showLabels) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.min.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                widget.max.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
        if (widget.showValues) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Start: ${_currentValues.start.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                'End: ${_currentValues.end.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
