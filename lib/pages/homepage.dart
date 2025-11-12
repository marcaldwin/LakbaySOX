// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:lakbaysox/pages/save_destinationpage.dart';
import '../controller/map_controller.dart';
import '../widgets/search_bar.dart'; // ✅ import your custom search bar
import '../widgets/map_footer.dart';
import '../widgets/category_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  // This function will run when a category is tapped

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final mapHandler = MapControllerHandler();
  final TextEditingController searchController =
      TextEditingController(); // ✅ create controller

  bool showMaptypeOptions = false;

  @override
  void dispose() {
    mapHandler.dispose();
    searchController.dispose();
    super.dispose();
  }

  void handleCategoryTap(BuildContext context, String category) {
    if (category == 'Destinations') {
      Navigator.pushNamed(
        context,
        '/destinations',
      ); // or push to your destination page
    } else if (category == 'Accommodation') {
      Navigator.pushNamed(context, '/accommodation');
    } else if (category == 'Restaurants') {
      Navigator.pushNamed(context, '/restaurants');
    } else if (category == 'Events') {
      Navigator.pushNamed(context, '/events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🗺 MAP
          OSMFlutter(
            controller: mapHandler.controller,
            osmOption: mapHandler.options,
          ),

          /// 🔍 SEARCH BAR
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SearchBarWidget(
                controller: searchController,
                prefixIcon: Icons.location_on,
                suffixIcon: Icons.search,
                hintText: "Search for a location",
                onSubmitted: (query) {
                  debugPrint('Search: $query');
                },
              ),
            ),
          ),

          // if (showMaptypeOptions)
          //   Positioned(
          //     bottom: 80,
          //     left: 10,
          //     right: 10,
          //     child: Container(
          //       padding: const EdgeInsets.all(16),
          //       decoration: BoxDecoration(
          //         color: Colors.white.withOpacity(0.95),
          //         borderRadius: BorderRadius.circular(20),
          //         boxShadow: const [
          //           BoxShadow(
          //             color: Colors.black26,
          //             blurRadius: 10,
          //             offset: Offset(0, 4),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           // Default Map
          //           IconButton(
          //             onPressed: () async {
          //               await mapHandler.changeToDefault();
          //             },
          //             icon: const Icon(Icons.map),
          //             tooltip: 'Default Map',
          //           ),
          //           // Terrain Map
          //           IconButton(
          //             onPressed: () async {
          //               await mapHandler.changeToTerrain();
          //             },
          //             icon: const Icon(Icons.terrain),
          //             tooltip: 'Terrain Map',
          //           ),
          //           // Satellite Map
          //           IconButton(
          //             onPressed: () async {
          //               await mapHandler.changeToSatellite();
          //             },
          //             icon: const Icon(Icons.satellite),
          //             tooltip: 'Satellite Map',
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),

          ///Mapfooter
          Positioned(
            top: 110, // 👈 adjust this value to move it lower/higher
            left: 0,
            right: 0,
            child: CategoryButton(
              onCategoryTap: (category) => handleCategoryTap(context, category),
            ),
          ),
          MapFooter(
            onMapTypePressed: () {
              setState(() {
                showMaptypeOptions = !showMaptypeOptions;
              });
            },
            onCurrentLocationPressed: () {},
            onRoutePressed: () {
              Navigator.pushNamed(context, '/chooseDestination');
            },

            onSavePressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  final mediaQuery = MediaQuery.of(context);
                  return SafeArea(
                    top: true,
                    child: SizedBox(
                      height: mediaQuery.size.height, // ✅ Use it here
                      child: const SaveDestinationpage(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
