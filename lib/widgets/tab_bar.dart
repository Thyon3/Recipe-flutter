import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;
  final int currentIndex;
  final Function(int) onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  
  const CustomTabBar({
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
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
