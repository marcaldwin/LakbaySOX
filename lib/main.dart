import 'package:flutter/material.dart';
import 'package:lakbaysox/pages/accommodation_page.dart';
import 'package:lakbaysox/pages/destination_page.dart';
import 'package:lakbaysox/pages/home_page.dart';
import 'package:lakbaysox/onboarding_screen.dart';
import 'package:lakbaysox/pages/choose_destination_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      routes: {
        '/homepage': (context) => const Homepage(),
        '/destinations': (context) => const Destinationpage(),
        '/accommodation': (context) => const Accommodationpage(),
        '/chooseDestination': (context) => const ChooseDestinationPage(),
      },
    );
  }
}
