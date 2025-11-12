import 'package:flutter/material.dart';
import 'package:lakbaysox/model/route.dart';
import 'package:lakbaysox/widgets/route_input_box.dart';
import 'package:lakbaysox/widgets/transport_buttons.dart';
import 'package:lakbaysox/widgets/route_list_item.dart';

class ChooseDestinationPage extends StatefulWidget {
  const ChooseDestinationPage({super.key});

  @override
  State<ChooseDestinationPage> createState() => _ChooseDestinationPageState();
}

class _ChooseDestinationPageState extends State<ChooseDestinationPage> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  final List<RouteModel> routes = [
    RouteModel(
      name: "El Carlito’s Resort",
      location: "Tacurong City, Sultan Kudarat",
    ),
    RouteModel(
      name: "Monte Vicenteau",
      location: "Tacurong City, Sultan Kudarat",
    ),
    RouteModel(
      name: "Lake Sebu Seven Falls",
      location: "Tacurong City, Sultan Kudarat",
    ),
    RouteModel(
      name: "El Carlito’s Resort",
      location: "Tacurong City, Sultan Kudarat",
    ),
    RouteModel(name: "Gwapo Ko", location: "Tacurong City, Sultan Kudarat"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBF2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Choose Destination',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              RouteInputBox(
                fromController: _fromController,
                toController: _toController,
              ),
              const SizedBox(height: 16),

              TransportButtons(
                onSelected: (mode) {
                  debugPrint("Selected transport: $mode");
                },
              ),
              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                height: 4,
                color: const Color(0xFF97B876),
              ),
              const SizedBox(height: 10),

              // 🧭 Scrollable list of routes
              Expanded(
                child: ListView.builder(
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    return RouteListItem(route: routes[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
