import 'package:flutter/material.dart';

class FilterBarWidget extends StatefulWidget {
  final List<String> filters;
  final void Function(String selectedFilter)? onSelected;

  const FilterBarWidget({super.key, required this.filters, this.onSelected});

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF97B876); // ✅ green accent

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.filters.length, (index) {
          final isSelected = _selectedIndex == index;
          final filter = widget.filters[index];
          final bool isFilterIcon = filter.toLowerCase() == 'all';

          // 🟢 ICON FILTER (no box)
          if (isFilterIcon) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() => _selectedIndex = index);
                  widget.onSelected?.call(filter);
                },
                child: const Icon(Icons.tune, color: Colors.black, size: 28),
              ),
            );
          }

          // 🟢 NORMAL FILTER BUTTONS
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = index);
                widget.onSelected?.call(filter);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? borderColor : Colors.white,
                  border: Border.all(color: borderColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
