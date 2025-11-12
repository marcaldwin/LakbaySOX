import 'package:flutter/material.dart';
import 'package:lakbaysox/model/accommodation.dart';

class AccommodationCard extends StatelessWidget {
  final Accommodation accommodation;
  const AccommodationCard({super.key, required this.accommodation});

  @override
  Widget build(BuildContext context) {
    // Always non-empty (falls back to cover image)
    final images = accommodation.gallery;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal gallery
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      images[index],
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
              Expanded(
                child: Text(
                  accommodation.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.bookmark_border, color: Colors.black),
            ],
          ),
          const SizedBox(height: 6),

          // Rating (+ optional reviews)
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(
                accommodation.reviews == null
                    ? accommodation.rating.toStringAsFixed(1)
                    : '${accommodation.rating.toStringAsFixed(1)} (${accommodation.reviews} reviews)',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Location (legacy-friendly)
          if (accommodation.location != null) ...[
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.black54),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    accommodation.location!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],

          // Amenities chips (show up to 3, then +N more)
          if (accommodation.amenities.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: -6,
              children: [
                for (final a in accommodation.amenities.take(3))
                  Chip(
                    label: Text(a),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: const BorderSide(color: Color(0xFF97B876)),
                  ),
                if (accommodation.amenities.length > 3)
                  Chip(
                    label: Text('+${accommodation.amenities.length - 3} more'),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: const BorderSide(color: Color(0xFF97B876)),
                  ),
              ],
            ),
            const SizedBox(height: 6),
          ],

          // Price
          Text(
            accommodation.priceLabel, // e.g., ₱1800/night
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 10),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // debugPrint('Contact: ${accommodation.contact}');
              },
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
