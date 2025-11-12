import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final void Function(String category) onCategoryTap;

  const CategoryButton({super.key, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.place, 'label': 'Destinations'},
      {'icon': Icons.hotel, 'label': 'Accommodation'},
      {'icon': Icons.restaurant, 'label': 'Restaurants'},
      {'icon': Icons.event, 'label': 'Events'},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            categories.map((cat) {
              return GestureDetector(
                onTap: () => onCategoryTap(cat['label']?.toString() ?? ''),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      radius: 28,
                      child: Icon(
                        cat['icon'] as IconData,
                        color: Colors.green,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      cat['label'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
