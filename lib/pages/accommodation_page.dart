import 'package:flutter/material.dart';
import 'package:lakbaysox/widgets/search_bar.dart';
import 'package:lakbaysox/widgets/filter_bar.dart';
import 'package:lakbaysox/widgets/accommodation_card.dart';
import 'package:lakbaysox/model/accommodation.dart';

class Accommodationpage extends StatefulWidget {
  const Accommodationpage({super.key});

  @override
  State<Accommodationpage> createState() => _AccommodationpageState();
}

class _AccommodationpageState extends State<Accommodationpage> {
  final TextEditingController _searchController = TextEditingController();

  // 🔥 DELETE THIS when backend is ready
  // This is just temporary mock data for testing UI
  final List<Accommodation> accommodations = [
    Accommodation(
      name: 'Sunrise Resort',
      rating: 4.5,
      reviews: 128,
      location: 'General Santos City',
      images: [
        'https://picsum.photos/200/150?2',
        'https://picsum.photos/200/150?3',
        'https://picsum.photos/200/150?4',
      ],
    ),
    Accommodation(
      name: 'Lakeview Hotel',
      rating: 4.2,
      reviews: 89,
      location: 'Koronadal City',
      images: [
        'https://picsum.photos/200/150?5',
        'https://picsum.photos/200/150?6',
        'https://picsum.photos/200/150?8',
      ],
    ),
    Accommodation(
      name: 'example123',
      rating: 4.2,
      reviews: 89,
      location: 'Koronadal City',
      images: [
        'https://picsum.photos/200/150?9',
        'https://picsum.photos/200/150?10',
        'https://picsum.photos/200/150?11',
      ],
    ),
    Accommodation(
      name: 'tae Hotel',
      rating: 4.2,
      reviews: 89,
      location: 'manila City',
      images: [
        'https://picsum.photos/200/150?12',
        'https://picsum.photos/200/150?13',
        'https://picsum.photos/200/150?14',
      ],
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SearchBarWidget(
                      controller: _searchController,
                      prefixIcon: Icons.arrow_back,
                      suffixIcon: Icons.close,
                      hintText: "Accommodation",
                      onSubmitted: (query) {
                        debugPrint('Search: $query');
                      },
                    ),
                  ),
                ),
                FilterBarWidget(
                  filters: ['All', 'Hotels', 'Resorts', 'Homestays'],
                  onSelected: (filter) {
                    debugPrint('Selected filter: $filter');
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // Green divider
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 8,
          //   color: const Color(0xFF97B876),
          // ),

          // Accommodation List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: accommodations.length,
              itemBuilder: (context, index) {
                final accommodation = accommodations[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Green border
                      Container(
                        width: double.infinity,
                        height: 8,
                        color: const Color(0xFF97B876),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: AccommodationCard(accommodation: accommodation),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // 🧩 BACKEND NOTE:
          // When backend is ready, remove the mock `accommodations` list
          // and replace the ListView.builder’s data source with:
          //  - FutureBuilder() if you’re fetching from REST API
          //  - StreamBuilder() if you’re using Firebase/Firestore
        ],
      ),
    );
  }
}
