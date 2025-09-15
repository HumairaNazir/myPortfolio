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
                children: projects.map((project) {
                  return ProjectCard(
                    images:
                        List<String>.from(project['images']), // ✅ fixed here
                    title: project['title'],
                    description: project['description'],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// List of projects
final List<Map<String, dynamic>> projects = [
  {
    'images': [
      'assets/images/weatherapp_imgs/home.jpeg',
      'assets/images/weatherapp_imgs/forecast.jpeg',
      'assets/images/weatherapp_imgs/timing.jpeg',
      'assets/images/weatherapp_imgs/cmps.jpeg',
      'assets/images/weatherapp_imgs/humidity.jpeg',
      'assets/images/weatherapp_imgs/wind.jpeg',
      'assets/images/weatherapp_imgs/setting.jpeg',
      'assets/images/weatherapp_imgs/ther.jpeg',
    ],
    'title': 'Weather App',
    'description': 'Built with MVC architecture and REST API integration.',
  },
  {
    'images': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/weatherapp_imgs/home.jpeg',
    ],
    'title': 'Chat App',
    'description': 'Firebase-based app using Provider for state management.',
  },
  {
    'images': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/profile.png',
    ],
    'title': 'Recipe App',
    'description': 'Built with Firebase and Provider.',
  },
  {
    'images': [
      'assets/images/logo.png',
      'assets/images/profile.png',
      'assets/images/profile.png',
    ],
    'title': 'E-commerce App',
    'description': 'Built with Flutter and Stripe payment integration.',
  },
];
