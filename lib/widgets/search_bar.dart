import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final IconData? prefixIcon; // ✅ Custom prefix icon
  final IconData? suffixIcon; // ✅ Custom suffix icon
  final String hintText; // ✅ Custom hint text

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText = "Search...", // default
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF97B876); // ✅ Soft green border

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: TextField(
        controller: controller,
        cursorColor: borderColor,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          prefixIcon:
              prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.black)
                  : null, // ✅ Only show if provided
          suffixIcon:
              suffixIcon != null
                  ? Icon(suffixIcon, color: Colors.black)
                  : null, // ✅ Only show if provided
        ),
        onSubmitted: (value) {
          if (onSubmitted != null) {
            onSubmitted!(value);
          }
        },
      ),
    );
  }
}
