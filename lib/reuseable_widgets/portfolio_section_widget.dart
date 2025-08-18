import 'package:flutter/material.dart';
import 'package:portfolio/reuseable_widgets/portfolio_card_widget.dart';

class PortfolioSectionWidget extends StatelessWidget {
  const PortfolioSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black54,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    projectCard(
                      imagePaths: [
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/profile.png',
                      ],
                      title: 'Weather App',
                      description:
                          'Built with MVC architecture and REST API integration.',
                    ),
                    projectCard(
                      imagePaths: [
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                      ],
                      title: 'Chat App',
                      description:
                          'Firebase-based app using Provider for state management.',
                    ),
                    projectCard(
                      imagePaths: [
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                      ],
                      title: 'Recipe App',
                      description: 'Built with Firebase and Provider.',
                    ),
                    projectCard(
                      imagePaths: [
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                      ],
                      title: 'Recipe App',
                      description: 'Built with Firebase and Provider.',
                    ),
                    projectCard(
                      imagePaths: [
                        'assets/images/logo.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                      ],
                      title: 'Recipe App',
                      description: 'Built with Firebase and Provider.',
                    ),
                    projectCard(
                      imagePaths: [
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/logo.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                      ],
                      title: 'Chat App',
                      description:
                          'Firebase-based app using Provider for state management.',
                    ),
                    // Add more cards if needed
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

final List<Map<String, dynamic>> projects = [
  {
    'images': [
      'assets/images/profile.png',
      'assets/images/profile.png',
      'assets/images/profile.png',
    ],
    'title': 'Weather App',
    'description': 'Built with MVC architecture and REST API integration.',
  },
  {
    'images': [
      'assets/images/profile.png',
      'assets/images/profile.png',
      'assets/images/profile.png',
    ],
    'title': 'Chat App',
    'description': 'Firebase-based app using Provider for state management.',
  },
  {
    'images': [
      'assets/images/profile.png',
      'assets/images/profile.png',
      'assets/images/profile.png',
    ],
    'title': 'E-commerce App',
    'description': 'Built with Flutter and Stripe payment integration.',
  },
];
