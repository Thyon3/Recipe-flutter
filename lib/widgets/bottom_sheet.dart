import 'package:flutter/material.dart';
import '../constants.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final double? height;
  final bool isDismissible;
  final bool enableDrag;
  final VoidCallback? onClosed;
  
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.height,
    this.isDismissible = true,
    this.enableDrag = true,
    this.onClosed,
  });
  
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double? height,
    bool isDismissible = true,
    bool enableDrag = true,
    VoidCallback? onClosed,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        height: height,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        onClosed: onClosed,
        child: child,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  final List<String> categories;
  final List<String> selectedCategories;
  final Function(List<String>) onApply;
  final VoidCallback? onClear;
  
  const FilterBottomSheet({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onApply,
    this.onClear,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (onClear != null)
                  TextButton(
                    onPressed: onClear,
                    child: const Text('Clear All'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            // Category chips would go here
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onApply(selectedCategories);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
