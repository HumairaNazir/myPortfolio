import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/reuseable_widgets/about_section_widget.dart';
import 'package:portfolio/reuseable_widgets/contact_section_widget.dart';
import 'package:portfolio/reuseable_widgets/cv_download_button.dart';
import 'package:portfolio/reuseable_widgets/hero_section_widget.dart';

import '../reuseable_widgets/portfolio_card_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  void onNavMenuTap(int index) {
    final keyContext = navbarKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('My Portfolio', style: TextStyle(color: Colors.amber)),
        actions: [
          TextButton(
            onPressed: () {
              onNavMenuTap(0);
            },
            child: const Text('Home', style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(1);
            },
            child: const Text('About', style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(2);
            },
            child:
                const Text('Portfolio', style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(3);
            },
            child: const Text('CV', style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(4);
            },
            child: const Text('Contact', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Hero Banner

            HeroSectionWidget(
              key: navbarKeys.first,
            ),
            // About Section (light background)
            AboutSectionWidget(
              key: navbarKeys[1],
            ),

            // Portfolio Section with Mustard Cards

            Container(
                key: navbarKeys[2],
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
                )),

            // Contact Section
            ContactSectionWidget(
              key: navbarKeys[4],
            ),
            SizedBox(
              height: 20,
            ),
            CvDownloadButton(
              key: navbarKeys[3],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
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
