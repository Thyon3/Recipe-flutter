import 'package:flutter/material.dart';
import '../constants.dart';
import '../utils.dart';

class CounterDisplay extends StatelessWidget {
  final int count;
  
  const CounterDisplay({
    super.key,
    required this.count,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Current Count:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppUtils.formatCounter(count),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppUtils.isEven(count) ? 'Even Number' : 'Odd Number',
            style: TextStyle(
              fontSize: 14,
              color: AppUtils.isEven(count) 
                  ? AppConstants.secondaryColor 
                  : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
