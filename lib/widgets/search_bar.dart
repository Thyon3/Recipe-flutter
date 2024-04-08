import 'package:flutter/material.dart';
import 'dart:async';
import '../constants.dart';
import '../utils.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final String hintText;
  final bool autofocus;
  
  const CustomSearchBar({
    super.key,
    required this.onSearch,
    this.hintText = 'Search recipes...',
    this.autofocus = false,
    this.controller,
    this.onClear,
    this.debounceDelay = AppConstants.debounceDelay,
    this.showSuggestions = false,
    this.suggestions,
    this.enableVoiceSearch = false,
    this.onVoiceSearch,
  });
  
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  Timer? _debounceTimer;
  List<String> _filteredSuggestions = [];
  
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }
  
  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }
  
  void _onTextChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.debounceDelay, () {
      final query = _controller.text.trim();
      if (query.isNotEmpty) {
        widget.onSearch(query);
      }
      _updateSuggestions(query);
    });
  }
  
  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _updateSuggestions(_controller.text);
    } else {
      setState(() {
        _filteredSuggestions = [];
      });
    }
  }
  
  void _updateSuggestions(String query) {
    if (!widget.showSuggestions || widget.suggestions == null) {
      setState(() {
        _filteredSuggestions = [];
      });
      return;
    }
    
    final filtered = widget.suggestions!
        .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();
    
    setState(() {
      _filteredSuggestions = filtered;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: widget.autofocus,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        widget.onClear?.call();
                        widget.onSearch('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: 12,
              ),
            ),
            onSubmitted: widget.onSearch,
          ),
        ),
        if (_filteredSuggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredSuggestions.length,
              itemBuilder: (context, index) {
                final suggestion = _filteredSuggestions[index];
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.history),
                  title: Text(suggestion),
                  onTap: () {
                    _controller.text = suggestion;
                    widget.onSearch(suggestion);
                    _focusNode.unfocus();
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
