import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;

  // ✅ Add these optional callbacks
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onPrefixTap;
  final VoidCallback? onSuffixTap;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onPrefixTap,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged, // ✅ now supported
      onSubmitted: onSubmitted, // ✅ still supported
      decoration: InputDecoration(
        prefixIcon:
            prefixIcon == null
                ? null
                : IconButton(
                  icon: Icon(prefixIcon),
                  onPressed: onPrefixTap, // ✅ now supported
                ),
        suffixIcon:
            suffixIcon == null
                ? null
                : IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onSuffixTap, // ✅ now supported
                ),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
    );
  }
}
