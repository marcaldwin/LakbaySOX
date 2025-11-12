import 'package:flutter/material.dart';
import 'package:lakbaysox/pages/accommodationpage.dart';
import 'package:lakbaysox/pages/destinationpage.dart';
import 'package:lakbaysox/pages/homepage.dart';
import 'onboarding_screen.dart';
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
        'lib/pages/homepage': (context) => const Homepage(),
        '/destinations': (context) => const Destinationpage(),
        '/accommodation': (context) => const Accommodationpage(),
        '/chooseDestination': (context) => const ChooseDestinationPage(),
      },
    );
  }
}
