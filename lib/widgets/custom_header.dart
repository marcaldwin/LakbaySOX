import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onSearchTap;
  final bool isSearchMode;
  final VoidCallback? onCancelSearch;
  final VoidCallback? onBack;
  final ValueChanged<String>? onSearchChanged;

  const CustomHeader({
    super.key,
    this.title,
    this.onBack,
    this.onSearchTap,
    this.onCancelSearch,
    this.isSearchMode = false,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder:
            (child, animation) =>
                FadeTransition(opacity: animation, child: child),
        child:
            isSearchMode
                ? _buildSearchMode(context)
                : _buildNormalMode(context),
      ),
    );
  }

  /// --- Normal Header ---
  Widget _buildNormalMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onBack ?? () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Text(
              title ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(onPressed: onSearchTap, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }

  /// --- Search Mode Header ---
  Widget _buildSearchMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF97B876), width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: onCancelSearch,
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  onChanged: onSearchChanged,
                  decoration: const InputDecoration(
                    hintText: 'Search destination...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: onCancelSearch,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
