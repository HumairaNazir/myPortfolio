import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../reuseable_widgets/portfolio_card_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
            const Text('My Portfolio', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              onNavMenuTap(0);
            },
            child: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(1);
            },
            child: const Text('About', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(2);
            },
            child:
                const Text('Portfolio', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              onNavMenuTap(3);
            },
            child: const Text('Contact', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Hero Banner
            Container(
              key: navbarKeys.first,
              height: MediaQuery.of(context).size.height * 0.9,
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Humaira Nazir',
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Flutter Developer | 2 Years Experience',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.linked_camera,
                              color: Colors.white),
                          onPressed: () => _launchURL(
                              'https://www.linkedin.com/in/your-profile'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.code, color: Colors.white),
                          onPressed: () =>
                              _launchURL('https://github.com/your-github'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.mail, color: Colors.white),
                          onPressed: () =>
                              _launchURL('mailto:humaira.dev@gmail.com'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // About Section (light background)
            Container(
              key: navbarKeys[1],
              color: Colors.black54,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Me',
                      style: GoogleFonts.poppins(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    'I am Humaira Nazir, a dedicated Flutter developer with 2 years of experience building high-performance mobile apps. I am passionate about writing clean code, exploring new technologies, and delivering outstanding user experiences.',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ],
              ),
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
                                'assets/images/profile.png',
                                'assets/images/profile.png',
                                'assets/images/profile.png',
                              ],
                              title: 'Weather App',
                              description:
                                  'Built with MVC architecture and REST API integration.',
                            ),
                            projectCard(
                              imagePaths: [
                                'assets/images/profile.png',
                                'assets/images/profile.png',
                                'assets/images/profile.png',
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
                                'assets/images/profile.png',
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
                                'assets/images/profile.png',
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
                                'assets/images/profile.png',
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
                                'assets/images/profile.png',
                                'assets/images/profile.png',
                                'assets/images/profile.png',
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
            Container(
              key: navbarKeys[3],
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact',
                      style: GoogleFonts.poppins(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    'Feel free to reach out via email or LinkedIn. I’m always open to freelance projects and collaborations!',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
