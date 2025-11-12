import 'package:flutter/material.dart';

class RouteInputBox extends StatelessWidget {
  final TextEditingController fromController;
  final TextEditingController toController;

  const RouteInputBox({
    super.key,
    required this.fromController,
    required this.toController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF97B876), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.my_location, color: Colors.black),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: fromController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Location',
                  ),
                ),
              ),
              const Icon(Icons.swap_vert, color: Colors.black),
            ],
          ),
          const Divider(color: Color(0xFF97B876), thickness: 1),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.black),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: toController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Choose Destination',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
