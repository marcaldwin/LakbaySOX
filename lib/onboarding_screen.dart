import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to\nLakbay SOX!',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0xFF325D34),
              ),
            ),
            const SizedBox(height: 20),
            const Image(image: AssetImage('lib/assets/image/logo.png')),
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        '   "Explore the vibrant culture,\n'
                        'landscapes, and hidden gems of\n',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'SOCCSKSARGEN',

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homepage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF325D34),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: (const Text(
                  'Start Exploring',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
