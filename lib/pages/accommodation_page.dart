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
  String _selectedFilter = 'All';

  // Mock data (keep until backend)
  final List<Accommodation> accommodations = [
    Accommodation(
      id: 'acc_001',
      name: 'Sunrise Resort',
      imageUrl: 'https://picsum.photos/seed/acc1/640/420',
      pricePerNight: 1800,
      rating: 4.5,
      amenities: const ['wifi', 'pool', 'parking'],
      lat: 6.111,
      lng: 125.171,
      contact: '+63 912 345 6789',
      reviews: 128,
      location: 'General Santos City',
      images: const [
        'https://picsum.photos/seed/acc1a/600/400',
        'https://picsum.photos/seed/acc1b/600/400',
        'https://picsum.photos/seed/acc1c/600/400',
      ],
    ),
    Accommodation(
      id: 'acc_002',
      name: 'Lakeview Hotel',
      imageUrl: 'https://picsum.photos/seed/acc2/640/420',
      pricePerNight: 2400,
      rating: 4.2,
      amenities: const ['wifi', 'breakfast', 'lake_view'],
      lat: 6.250,
      lng: 124.990,
      contact: 'stay@lakeview.ph',
      reviews: 89,
      location: 'Koronadal City',
      images: const [
        'https://picsum.photos/seed/acc2a/600/400',
        'https://picsum.photos/seed/acc2b/600/400',
        'https://picsum.photos/seed/acc2c/600/400',
      ],
    ),
    Accommodation(
      id: 'acc_003',
      name: 'City Suites',
      imageUrl: 'https://picsum.photos/seed/acc3/640/420',
      pricePerNight: 1500,
      rating: 4.2,
      amenities: const ['wifi', 'aircon'],
      lat: 6.120,
      lng: 125.010,
      contact: '+63 900 111 2222',
      reviews: 102,
      location: 'Koronadal City',
    ),
    Accommodation(
      id: 'acc_004',
      name: 'Bayfront Homestay',
      imageUrl: 'https://picsum.photos/seed/acc4/640/420',
      pricePerNight: 900,
      rating: 4.1,
      amenities: const ['kitchen', 'near_beach'],
      lat: 5.990,
      lng: 125.300,
      contact: 'host@bayfront.ph',
      reviews: 56,
      location: 'Glan, Sarangani',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matchesFilter(Accommodation a) {
    // Simple, UI-only mapping until you add a real "type" field
    switch (_selectedFilter) {
      case 'Hotels':
        return a.name.toLowerCase().contains('hotel') ||
            a.amenities.any((x) => x.toLowerCase().contains('breakfast'));
      case 'Resorts':
        return a.name.toLowerCase().contains('resort') ||
            a.amenities.any((x) => x.toLowerCase().contains('pool'));
      case 'Homestays':
        return a.name.toLowerCase().contains('homestay') ||
            a.amenities.any((x) => x.toLowerCase().contains('kitchen'));
      default:
        return true; // 'All'
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();

    // Search by name/location/amenities + selected filter
    final visible =
        accommodations.where((a) {
          final inName = a.name.toLowerCase().contains(query);
          final inLoc = (a.location ?? '').toLowerCase().contains(query);
          final inAmen = a.amenities.any(
            (am) => am.toLowerCase().contains(query),
          );
          final passesSearch =
              query.isEmpty ? true : (inName || inLoc || inAmen);
          return passesSearch && _matchesFilter(a);
        }).toList();

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
                      onSubmitted: (_) => setState(() {}),
                      onChanged: (_) => setState(() {}),
                      // 👇 Make the icons do something useful
                      onPrefixTap: () => Navigator.maybePop(context),
                      onSuffixTap: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    ),
                  ),
                ),
                FilterBarWidget(
                  filters: const ['All', 'Hotels', 'Resorts', 'Homestays'],
                  onSelected: (filter) {
                    setState(() => _selectedFilter = filter);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child:
                visible.isEmpty
                    ? _EmptyState(
                      label:
                          query.isEmpty
                              ? 'No accommodations found'
                              : 'No results for “$query”',
                      onClear:
                          (query.isNotEmpty || _selectedFilter != 'All')
                              ? () {
                                _searchController.clear();
                                _selectedFilter = 'All';
                                setState(() {});
                              }
                              : null,
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: visible.length,
                      itemBuilder: (context, index) {
                        final a = visible[index];
                        return Padding(
                          key: ValueKey(a.id),
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
                                child: AccommodationCard(accommodation: a),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String label;
  final VoidCallback? onClear;
  const _EmptyState({required this.label, this.onClear});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_off, size: 48, color: Colors.black26),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 16)),
          if (onClear != null) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: onClear,
              child: const Text('Clear search & filters'),
            ),
          ],
        ],
      ),
    );
  }
}
