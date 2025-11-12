import 'package:flutter/material.dart';

class MapFooter extends StatelessWidget {
  final VoidCallback? onMapTypePressed;
  final VoidCallback? onSavePressed;
  final VoidCallback? onCurrentLocationPressed;
  final VoidCallback? onRoutePressed;

  const MapFooter({
    super.key,
    this.onMapTypePressed,
    this.onSavePressed,
    this.onCurrentLocationPressed,
    this.onRoutePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            // bottomLeft and bottomRight stay 0 by default
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.map), onPressed: onMapTypePressed),
            IconButton(icon: const Icon(Icons.bookmark), onPressed: onSavePressed),
            IconButton(
              icon: const Icon(Icons.location_on),
              onPressed: onCurrentLocationPressed,
            ),
            IconButton(icon: const Icon(Icons.route), onPressed: onRoutePressed),
          ],
        ),
      ),
    );
  }
}
