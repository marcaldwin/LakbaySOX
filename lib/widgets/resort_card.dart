import 'package:flutter/material.dart';
import 'package:lakbaysox/model/resort.dart';

class ResortCard extends StatelessWidget {
  final Resort resort;
  final VoidCallback? onFavoriteTap;
  final double height;
  final double? imageSize;

  const ResortCard({
    super.key,
    required this.resort,
    this.onFavoriteTap,
    this.height = 120,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final double computedImageSize = (imageSize ?? (height - 24)).clamp(
      40.0,
      double.infinity,
    );

    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF97B876), width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                resort.imageUrl,
                width: computedImageSize,
                height: computedImageSize,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          resort.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: onFavoriteTap ?? () {},
                        icon: Icon(
                          resort.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: const Color(0xFF97B876),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    resort.caption ?? '',
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(resort.rating.toStringAsFixed(1)),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          // `location` getter maps to municipality in the new model
                          resort.location,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
