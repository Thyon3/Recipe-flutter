import 'package:flutter/material.dart';
import '../constants.dart';
import 'category_chip.dart';

class FilterDialog extends StatefulWidget {
  final List<String> categories;
  final List<String> selectedCategories;
  final Function(List<String>) onApply;
  final String? title;
  final bool multiSelect;
  final int? maxSelections;
  final VoidCallback? onClear;
  
  const FilterDialog({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onApply,
    this.title,
    this.multiSelect = true,
    this.maxSelections,
    this.onClear,
  });
  
  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late List<String> _selectedCategories;
  
  @override
  void initState() {
    super.initState();
    _selectedCategories = List.from(widget.selectedCategories);
  }
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title ?? 'Filter by Categories',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.onClear != null)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategories.clear();
                      });
                      widget.onClear?.call();
                    },
                    child: const Text('Clear All'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.multiSelect ? 'Select multiple categories:' : 'Select one category:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.categories.map((category) {
                final isSelected = _selectedCategories.contains(category);
                final canSelect = widget.multiSelect || !isSelected || _selectedCategories.length <= 1;
                
                return CategoryChip(
                  label: category,
                  isSelected: isSelected,
                  onTap: canSelect ? () {
                    setState(() {
                      if (widget.multiSelect) {
                        if (isSelected) {
                          _selectedCategories.remove(category);
                        } else if (widget.maxSelections == null || _selectedCategories.length < widget.maxSelections!) {
                          _selectedCategories.add(category);
                        }
                      } else {
                        _selectedCategories.clear();
                        _selectedCategories.add(category);
                      }
                    });
                  } : null,
                  color: !canSelect ? Colors.grey[300] : null,
                );
              }).toList(),
            ),
            if (widget.maxSelections != null && widget.multiSelect)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '${_selectedCategories.length}/${widget.maxSelections} selected',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _selectedCategories.isNotEmpty
                      ? () {
                          widget.onApply(_selectedCategories);
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
