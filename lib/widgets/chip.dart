import 'package:flutter/material.dart';
import '../constants.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? deleteIconColor;
  final bool deletable;
  final bool selected;
  final EdgeInsetsGeometry? padding;
  
  const CustomChip({
    super.key,
    required this.label,
    this.onDelete,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.deleteIconColor,
    this.deletable = false,
    this.selected = false,
    this.padding,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.animationDuration,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor ?? 
              (selected ? AppConstants.primaryColor : Colors.grey[200]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppConstants.primaryColor : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: textColor ?? 
                    (selected ? Colors.white : Colors.black87),
                fontSize: 14,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (deletable && onDelete != null) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onDelete,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: deleteIconColor ?? 
                      (selected ? Colors.white : Colors.grey[600]),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class FilterChip extends StatefulWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final Color? selectedColor;
  final Color? backgroundColor;
  
  const FilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.selectedColor,
    this.backgroundColor,
  });
  
  @override
  State<FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChip> {
  late bool _selected;
  
  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }
  
  @override
  void didUpdateWidget(FilterChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      setState(() {
        _selected = widget.selected;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomChip(
      label: widget.label,
      selected: _selected,
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        widget.onSelected(_selected);
      },
      backgroundColor: widget.backgroundColor,
      selectedColor: widget.selectedColor,
    );
  }
}

class InputChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDelete;
  final VoidCallback? onSelected;
  final bool selected;
  final Color? selectedColor;
  final Color? backgroundColor;
  
  const InputChip({
    super.key,
    required this.label,
    this.onDelete,
    this.onSelected,
    this.selected = false,
    this.selectedColor,
    this.backgroundColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomChip(
      label: label,
      selected: selected,
      onTap: onSelected,
      onDelete: onDelete,
      deletable: onDelete != null,
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
    );
  }
}
