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
  final List<Resort> resorts = [
    Resort(
      name: "Laguna Paradise",
      caption: "A calm escape surrounded by nature.",
      rating: 4.8,
      location: "South Cotabato",
      imageUrl:
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e", // demo only
    ),
    Resort(
      name: "Sunset Bay",
      caption: "Perfect for weekend getaways.",
      rating: 4.5,
      location: "Sarangani",
      imageUrl: "https://images.unsplash.com/photo-1493558103817-58b2924bce98",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredResorts =
        resorts.where((resort) {
          final query = _searchQuery.toLowerCase();
          return resort.name.toLowerCase().contains(query) ||
              resort.location.toLowerCase().contains(query);
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
            onSearchChanged: (value) {
              setState(() => _searchQuery = value);
            },
          ),

          // 👇 One Expanded only
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
                            setState(() {
                              resorts[index] = Resort(
                                name: resort.name,
                                caption: resort.caption,
                                rating: resort.rating,
                                location: resort.location,
                                imageUrl: resort.imageUrl,
                                isFavorite: !resort.isFavorite,
                              );
                            });
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
