import 'dart:convert';

class Accommodation {
  // New schema (required)
  final String id;
  final String name;
  final String imageUrl;
  final int pricePerNight; // in PHP (pesos)
  final double rating; // 0–5
  final List<String> amenities; // e.g., ["wifi", "pool", "parking"]
  final double lat;
  final double lng;
  final String contact; // phone/email/link (simple string for now)

  // Legacy / optional fields
  final int? reviews;
  final String? location; // keep for old UI labels
  final List<String>? images; // gallery; imageUrl will be used as cover
  final bool isFavorite; // handy for UI toggles

  const Accommodation({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pricePerNight,
    required this.rating,
    required this.amenities,
    required this.lat,
    required this.lng,
    required this.contact,
    this.reviews,
    this.location,
    this.images,
    this.isFavorite = false,
  });

  /// Friendly price for badges/cards
  String get priceLabel => '₱$pricePerNight/night';

  /// Gallery helper: always non-empty (falls back to [imageUrl])
  List<String> get gallery =>
      (images == null || images!.isEmpty) ? [imageUrl] : images!;

  Accommodation copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? pricePerNight,
    double? rating,
    List<String>? amenities,
    double? lat,
    double? lng,
    String? contact,
    int? reviews,
    String? location,
    List<String>? images,
    bool? isFavorite,
  }) {
    return Accommodation(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      rating: rating ?? this.rating,
      amenities: amenities ?? List<String>.from(this.amenities),
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      contact: contact ?? this.contact,
      reviews: reviews ?? this.reviews,
      location: location ?? this.location,
      images:
          images ??
          (this.images == null ? null : List<String>.from(this.images!)),
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'pricePerNight': pricePerNight,
    'rating': rating,
    'amenities': amenities,
    'lat': lat,
    'lng': lng,
    'contact': contact,
    // legacy/optional
    'reviews': reviews,
    'location': location,
    'images': images,
    'isFavorite': isFavorite,
  };

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    // prefer explicit imageUrl; otherwise fall back to first image in images[]
    final List<dynamic>? imgs = json['images'] as List<dynamic>?;
    final String? firstImage =
        (imgs != null && imgs.isNotEmpty) ? imgs.first.toString() : null;

    return Accommodation(
      id: json['id'].toString(),
      name: json['name'] as String,
      imageUrl: (json['imageUrl'] as String?) ?? firstImage ?? '',
      pricePerNight: (json['pricePerNight'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      amenities: (json['amenities'] as List).map((e) => e.toString()).toList(),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      contact: json['contact'] as String,
      // legacy/optional
      reviews: (json['reviews'] as num?)?.toInt(),
      location: json['location'] as String?,
      images: imgs?.map((e) => e.toString()).toList(),
      isFavorite: (json['isFavorite'] as bool?) ?? false,
    );
  }

  static List<Accommodation> demo() => [
    const Accommodation(
      id: 'acc_001',
      name: 'Coastal Inn',
      imageUrl: 'https://images.unsplash.com/photo-1551776235-dde6d4829808',
      pricePerNight: 1800,
      rating: 4.6,
      amenities: ['wifi', 'aircon', 'parking'],
      lat: 6.1103,
      lng: 125.1717,
      contact: '+63 912 345 6789',
      reviews: 124,
      location: 'Glan, Sarangani',
      images: [
        'https://images.unsplash.com/photo-1551776235-dde6d4829808',
        'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
      ],
    ),
    const Accommodation(
      id: 'acc_002',
      name: 'Highland Lodge',
      imageUrl: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb',
      pricePerNight: 2400,
      rating: 4.8,
      amenities: ['wifi', 'breakfast', 'mountain_view'],
      lat: 6.3705,
      lng: 124.9472,
      contact: 'stay@highlandlodge.ph',
      reviews: 89,
      location: 'Lake Sebu, South Cotabato',
    ),
  ];

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) => other is Accommodation && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
