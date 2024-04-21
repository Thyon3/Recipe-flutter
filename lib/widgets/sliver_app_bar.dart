import 'package:flutter/material.dart';
import '../constants.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final Widget? background;
  final List<Widget>? actions;
  final bool pinned;
  final bool floating;
  final bool snap;
  final double? expandedHeight;
  final Widget? flexibleSpace;
  
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.background,
    this.actions,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.expandedHeight,
    this.flexibleSpace,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: expandedHeight ?? 200,
      flexibleSpace: flexibleSpace ??
          FlexibleSpaceBar(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: background ??
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: _isSearching ? null : Text(widget.title),
      actions: _buildActions(),
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      pinned: widget.pinned,
      snap: widget.snap,
      floating: widget.floating,
      expandedHeight: widget.expandedHeight ?? (widget.showSearchBar ? 120 : 80),
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      elevation: widget.elevation,
      toolbarHeight: widget.toolbarHeight,
      titleTextStyle: widget.titleTextStyle,
      iconTheme: widget.iconTheme,
      centerTitle: widget.centerTitle,
      collapsedHeight: widget.collapsedHeight,
      stretch: widget.stretch,
      stretchTriggerOffset: widget.stretchTriggerOffsetValue ?? 100.0,
      flexibleSpace: _buildFlexibleSpace(),
    );
  }
  
  List<Widget>? _buildActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
          },
        ),
      ];
    }
    
    List<Widget> actions = [];
    
    if (widget.showSearchBar) {
      actions.add(
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
      );
    }
    
    if (widget.actions != null) {
      actions.addAll(widget.actions!);
    }
    
    return actions.isEmpty ? null : actions;
  }
  
  Widget? _buildFlexibleSpace() {
    if (widget.flexibleSpace != null) {
      return widget.flexibleSpace;
    }
    
    if (widget.showSearchBar && _isSearching) {
      return Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: CustomSearchBar(
          onSearch: widget.onSearch ?? (query) {},
          hintText: widget.searchHint ?? 'Search...',
          autofocus: true,
          controller: _searchController,
          suggestions: widget.searchSuggestions,
          showSuggestions: widget.searchSuggestions != null,
        ),
      );
    }
    
    if (widget.showSearchBar) {
      return Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: widget.foregroundColor ?? Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            CustomSearchBar(
              onSearch: widget.onSearch ?? (query) {},
              hintText: widget.searchHint ?? 'Search...',
              controller: _searchController,
              suggestions: widget.searchSuggestions,
              showSuggestions: widget.searchSuggestions != null,
            ),
          ],
        ),
      );
    }
    
    return null;
  }
}

class CollapsingSliverAppBar extends StatelessWidget {
  final String title;
  final Widget background;
  final List<Widget>? actions;
  final Widget? leading;
  final double expandedHeight;
  final bool pinned;
  final bool floating;
  final bool snap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final TextStyle? titleTextStyle;
  
  const CollapsingSliverAppBar({
    super.key,
    required this.title,
    required this.background,
    this.actions,
    this.leading,
    this.expandedHeight = 200,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.titleTextStyle,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      actions: actions,
      leading: leading,
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      centerTitle: centerTitle,
      titleTextStyle: titleTextStyle,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
            color: foregroundColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: background,
        collapseMode: CollapseMode.parallax,
      ),
      ],
      backgroundColor: AppConstants.primaryColor,
      foregroundColor: Colors.white,
    );
  }
}
