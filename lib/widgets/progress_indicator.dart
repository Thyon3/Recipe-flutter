import 'package:flutter/material.dart';
import '../constants.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double value;
  final double? strokeWidth;
  final Color? backgroundColor;
  final Color? color;
  final String? label;
  final bool showPercentage;
  final double? height;
  
  const CustomProgressIndicator({
    super.key,
    required this.value,
    this.strokeWidth,
    this.backgroundColor,
    this.color,
    this.label,
    this.showPercentage = true,
    this.height,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: height ?? 8,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: color ?? AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        if (showPercentage) ...[
          const SizedBox(height: 4),
          Text(
            '${(value * 100).toInt()}%',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ],
    );
  }
}

class CircularProgressIndicator extends StatelessWidget {
  final double value;
  final double? strokeWidth;
  final Color? backgroundColor;
  final Color? color;
  final String? label;
  final double? size;
  
  const CircularProgressIndicator({
    super.key,
    required this.value,
    this.strokeWidth,
    this.backgroundColor,
    this.color,
    this.label,
    this.size,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size ?? 60,
          height: size ?? 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: value.clamp(0.0, 1.0),
                strokeWidth: strokeWidth ?? 6,
                backgroundColor: backgroundColor ?? Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? AppConstants.primaryColor,
                ),
              ),
              if (label != null)
                Text(
                  label!,
                  style: TextStyle(
                    fontSize: (size ?? 60) * 0.2,
                    fontWeight: FontWeight.bold,
                    color: color ?? AppConstants.primaryColor,
                  ),
                ),
            ],
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          Text(
            '${(value * 100).toInt()}%',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ],
    );
  }
}

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String>? stepLabels;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? completedColor;
  
  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.stepLabels,
    this.activeColor,
    this.inactiveColor,
    this.completedColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(totalSteps, (index) {
            final isCompleted = index < currentStep;
            final isActive = index == currentStep;
            
            return Expanded(
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? (completedColor ?? AppConstants.primaryColor)
                          : isActive
                              ? (activeColor ?? AppConstants.primaryColor)
                              : (inactiveColor ?? Colors.grey[300]),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isCompleted
                          ? Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 12,
                                color: isActive ? Colors.white : Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  if (index < totalSteps - 1)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: isCompleted
                            ? (completedColor ?? AppConstants.primaryColor)
                            : (inactiveColor ?? Colors.grey[300]),
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
        if (stepLabels != null) ...[
          const SizedBox(height: 8),
          Row(
            children: List.generate(totalSteps, (index) {
              return Expanded(
                child: Text(
                  stepLabels![index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: index <= currentStep
                        ? Colors.black87
                        : Colors.grey[600],
                    fontWeight: index == currentStep
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}
