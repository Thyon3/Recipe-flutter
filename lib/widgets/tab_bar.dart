import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController? controller;
  final ValueChanged<int>? onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsetsGeometry? padding;
  final IndicatorSize indicatorSize;
  final double? indicatorWeight;
  final bool isScrollable;
  final TabBarIndicator? indicator;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double? height;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerHeight;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.padding,
    this.indicatorSize = IndicatorSize.tab,
    this.indicatorWeight,
    this.isScrollable = false,
    this.indicator,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.height,
    this.showDivider = false,
    this.dividerColor,
    this.dividerHeight,
  });

  @override
  Widget build(BuildContext context) {
    Widget tabBar = TabBar(
      controller: controller,
      onTap: onTap,
      tabs: tabs,
      indicatorColor: indicatorColor ?? AppConstants.primaryColor,
      labelColor: labelColor ?? AppConstants.primaryColor,
      unselectedLabelColor: unselectedLabelColor ?? Colors.grey[600],
      labelStyle: labelStyle ?? const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: unselectedLabelStyle ?? const TextStyle(fontWeight: FontWeight.w400),
      padding: padding,
      indicatorSize: indicatorSize,
      indicatorWeight: indicatorWeight ?? 2.0,
      isScrollable: isScrollable,
      indicator: indicator,
    );

    if (backgroundColor != null || border != null || borderRadius != null) {
      tabBar = Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: borderRadius,
        ),
        child: tabBar,
      );
    }

    if (showDivider) {
      tabBar = Column(
        children: [
          tabBar,
          Container(
            height: dividerHeight ?? 1.0,
            color: dividerColor ?? Colors.grey[300],
          ),
        ],
      );
    }

    return tabBar;
  }
}

class AnimatedTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final TabController? controller;
  final ValueChanged<int>? onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsetsGeometry? padding;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool isScrollable;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double? height;

  const AnimatedTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.padding,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.isScrollable = false,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.height,
  });

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.95 + (_animation.value * 0.05),
          child: Opacity(
            opacity: _animation.value,
            child: CustomTabBar(
              tabs: widget.tabs,
              controller: widget.controller,
              onTap: widget.onTap,
              indicatorColor: widget.indicatorColor,
              labelColor: widget.labelColor,
              unselectedLabelColor: widget.unselectedLabelColor,
              labelStyle: widget.labelStyle,
              unselectedLabelStyle: widget.unselectedLabelStyle,
              padding: widget.padding,
              isScrollable: widget.isScrollable,
              border: widget.border,
              borderRadius: widget.borderRadius,
              backgroundColor: widget.backgroundColor,
              height: widget.height,
            ),
          ),
        );
      },
    );
  }
}

class PillTabBar extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? borderRadius;
  final bool isScrollable;

  const PillTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    this.onTap,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.padding,
    this.height,
    this.borderRadius,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      decoration: BoxDecoration(
        color: unselectedColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
        itemCount: labels.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => widget.onTap?.call(index),
            child: AnimatedContainer(
              duration: AppConstants.animationDuration,
              margin: const EdgeInsets.all(4),
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? (selectedColor ?? AppConstants.primaryColor)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              child: Text(
                labels[index],
                style: TextStyle(
                  color: isSelected
                      ? (selectedTextColor ?? Colors.white)
                      : (unselectedTextColor ?? Colors.black87),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollableTabBar extends StatelessWidget {
  final List<String> tabs;
  final int currentIndex;
  final Function(int) onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  
  const ScrollableTabBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        isScrollable: true,
        indicatorColor: indicatorColor ?? AppConstants.primaryColor,
        labelColor: labelColor ?? AppConstants.primaryColor,
        unselectedLabelColor: unselectedLabelColor ?? Colors.grey,
        indicatorWeight: 3,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        tabs: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          return Tab(
            text: tab,
          );
        }).toList(),
        onTap: onTap,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }
}
