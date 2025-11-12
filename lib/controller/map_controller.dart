import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapControllerHandler {
  // Main map controller
  final MapController controller = MapController(
    initPosition: GeoPoint(
      latitude: 47.4358055, // You can replace this with Davao’s lat/lon later
      longitude: 8.4737324,
    ),
    areaLimit: const BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );

  // Map configuration options
  OSMOption get options => OSMOption(
    userTrackingOption: const UserTrackingOption(
      enableTracking: true,
      unFollowUser: false,
    ),
    zoomOption: const ZoomOption(
      initZoom: 14,
      minZoomLevel: 3,
      maxZoomLevel: 19,
      stepZoom: 1.0,
    ),
    userLocationMarker: UserLocationMaker(
      personMarker: const MarkerIcon(
        icon: Icon(
          Icons.location_history_rounded,
          color: Colors.green,
          size: 48,
        ),
      ),
      directionArrowMarker: const MarkerIcon(
        icon: Icon(Icons.double_arrow, size: 48),
      ),
    ),
    roadConfiguration: const RoadOption(roadColor: Colors.yellowAccent),
  );

  // Example function to zoom in
  Future<void> zoomIn() async {
    await controller.zoomIn();
  }

  // Example function to zoom out
  Future<void> zoomOut() async {
    await controller.zoomOut();
  }

  // Example: go to current location
  Future<void> goToCurrentLocation() async {
    await controller.currentLocation();
  }

  // Dispose controller when done
  void dispose() {
    controller.dispose();
  }
}
