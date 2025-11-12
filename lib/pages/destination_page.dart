import 'package:flutter/material.dart';
import 'package:lakbaysox/widgets/custom_header.dart';
import 'package:lakbaysox/widgets/resort_card.dart';
import 'package:lakbaysox/model/resort.dart';

class Destinationpage extends StatefulWidget {
  const Destinationpage({super.key});

  @override
  State<Destinationpage> createState() => _DestinationpageState();
}

class _DestinationpageState extends State<Destinationpage> {
  bool _isSearchMode = false;
  String _searchQuery = '';

  // ✅ Use the new Resort constructor (id, tags, municipality, lat/lng, etc.)
  final List<Resort> resorts = [
    Resort(
      id: 'res_laguna_paradise',
      name: "Laguna Paradise",
      caption: "A calm escape surrounded by nature.",
      rating: 4.8,
      imageUrl: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
      tags: const ['falls', 'nature'],
      lat: 6.246,
      lng: 124.990,
      municipality: "South Cotabato",
    ),
    Resort(
      id: 'res_sunset_bay',
      name: "Sunset Bay",
      caption: "Perfect for weekend getaways.",
      rating: 4.5,
      imageUrl: "https://images.unsplash.com/photo-1493558103817-58b2924bce98",
      tags: const ['beach', 'sunset'],
      lat: 5.827,
      lng: 125.210,
      municipality: "Sarangani",
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final q = _searchQuery.trim().toLowerCase();

    // 🔎 Search by name, municipality, or tags
    final filteredResorts =
        resorts.where((resort) {
          return resort.name.toLowerCase().contains(q) ||
              resort.municipality.toLowerCase().contains(q) ||
              resort.tags.any((t) => t.toLowerCase().contains(q));
        }).toList();

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            title: 'Popular Destination',
            isSearchMode: _isSearchMode,
            onSearchTap: () => setState(() => _isSearchMode = true),
            onCancelSearch: () {
              setState(() {
                _isSearchMode = false;
                _searchQuery = '';
              });
            },
            onSearchChanged: (value) => setState(() => _searchQuery = value),
          ),
          Expanded(
            child:
                filteredResorts.isEmpty
                    ? Center(
                      child: Text(
                        _searchQuery.isEmpty
                            ? 'No resorts available'
                            : 'No results found for "$_searchQuery"',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredResorts.length,
                      itemBuilder: (context, index) {
                        final resort = filteredResorts[index];
                        return ResortCard(
                          resort: resort,
                          onFavoriteTap: () {
                            // ✅ Toggle by id so filtering doesn’t break indices
                            final i = resorts.indexWhere(
                              (r) => r.id == resort.id,
                            );
                            if (i != -1) {
                              setState(() {
                                resorts[i] = resorts[i].copyWith(
                                  isFavorite: !resort.isFavorite,
                                );
                              });
                            }
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
