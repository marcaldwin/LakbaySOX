import 'package:flutter/material.dart';
import 'package:lakbaysox/model/accommodation.dart';

class AccommodationCard extends StatelessWidget {
  final Accommodation accommodation;
  const AccommodationCard({super.key, required this.accommodation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: accommodation.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      accommodation.images[index],
                      width: 130,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // Name + save icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accommodation.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Icon(Icons.bookmark_border, color: Colors.black),
            ],
          ),
          const SizedBox(height: 6),

          // Rating row
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(
                "${accommodation.rating} (${accommodation.reviews} reviews)",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Location
          Row(
            children: [
              const Icon(Icons.location_on, size: 18, color: Colors.black54),
              const SizedBox(width: 4),
              Text(accommodation.location),
            ],
          ),
          const SizedBox(height: 10),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF97B876),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                "Check Availability",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
