class Resort {
  final String name;
  final String caption;
  final double rating;
  final String location;
  final String imageUrl;
  final bool isFavorite;

  Resort({
    required this.name,
    required this.caption,
    required this.rating,
    required this.location,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
