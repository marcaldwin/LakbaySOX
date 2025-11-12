import 'package:flutter/material.dart';
import 'package:lakbaysox/model/route.dart';

class RouteListItem extends StatelessWidget {
  final RouteModel route;

  const RouteListItem({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 14,
      ), // ⬆️ more space between data
      padding: const EdgeInsets.all(20), // ⬆️ bigger padding (makes it larger)
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF97B876), width: 1.8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.access_time,
            color: Colors.black54,
            size: 28,
          ), // ⬆️ bigger icon
          const SizedBox(width: 16), // ⬆️ more gap between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  route.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, // ⬆️ bigger font
                  ),
                ),
                const SizedBox(height: 6), // ⬆️ space between name and location
                Text(
                  route.location,
                  style: const TextStyle(fontSize: 15), // ⬆️ slightly bigger
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
