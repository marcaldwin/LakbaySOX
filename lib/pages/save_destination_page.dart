import 'package:flutter/material.dart';

class SaveDestinationpage extends StatefulWidget {
  const SaveDestinationpage({super.key});

  @override
  State<SaveDestinationpage> createState() => _SaveDestinationpageState();
}

class _SaveDestinationpageState extends State<SaveDestinationpage>
    with SingleTickerProviderStateMixin {
  double _sheetHeightFactor = 0.5;
  late AnimationController _controller;
  late Animation<double> _animation;

  bool get _isExpanded => _sheetHeightFactor > 0.75;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _toggleSheet() {
    final newHeight = _isExpanded ? 0.5 : 1.0;
    _animation = Tween<double>(
        begin: _sheetHeightFactor,
        end: newHeight,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          _sheetHeightFactor = _animation.value;
        });
      });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final safeTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 🗺️ Background (map, etc.)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/5/55/Philippines_location_map.svg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🧩 The draggable-like sheet
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * _sheetHeightFactor,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔺 Always-visible arrow
                  Padding(
                    padding: EdgeInsets.only(
                      top: safeTop + 30, // 👈 keeps it below battery/notch
                      bottom: 4,
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: _toggleSheet,
                        child: AnimatedRotation(
                          turns: _isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(
                            Icons.keyboard_arrow_up,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 🏷 Title
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Saved Destinations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 📜 Scrollable list
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFF97B876),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/100/100?random=$index',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              'Saved Place #$index',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text(
                              'Tap to view details',
                              style: TextStyle(fontSize: 13),
                            ),
                            trailing: const Icon(
                              Icons.bookmark_border,
                              size: 22,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
