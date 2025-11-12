import 'package:flutter/material.dart';

class TransportButtons extends StatelessWidget {
  final Function(String) onSelected;

  const TransportButtons({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {'icon': Icons.directions_car, 'type': 'Car'},
      {'icon': Icons.directions_bus, 'type': 'Bus'},
      {'icon': Icons.directions_walk, 'type': 'Walk'},
      {'icon': Icons.directions_bike, 'type': 'Bike'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          buttons.map((b) {
            return IconButton(
              onPressed: () => onSelected(b['type'] as String),

              icon: Icon(b['icon'] as IconData, size: 28, color: Colors.black),
            );
          }).toList(),
    );
  }
}
