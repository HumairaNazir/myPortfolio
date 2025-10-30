import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/reuseable_widgets/portfolio_card_widget.dart';

class PortfolioSectionWidget extends StatelessWidget {
  const PortfolioSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Projects',
            style: GoogleFonts.poppins(
                color: Colors.orange,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(16), // <-- give inside space too
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: projects.map((project) {
              return ProjectCard(
                images: List<String>.from(project['images']),
                title: project['title'],
                description: project['description'],
                githubUrl: project['githubUrl'],
                apkUrl: project['apkUrl'],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

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
    'description':
        'A beautifully designed Weather App built with Flutter that shows live weather updates and a 7-day forecast powered by the OpenWeather API.',
    'githubUrl': 'https://github.com/HumairaNazir/final_thermometer_app',
    'apkUrl':
        'https://drive.google.com/file/d/1mr6onO3sxEHuV5zto_Ykw_J9cp-wYX1S/view?usp=sharing',
  },
  {
    'images': [
      'assets/images/newsapp_images/splash.jpeg',
      'assets/images/newsapp_images/homee.jpeg',
      'assets/images/newsapp_images/channels.jpeg',
      'assets/images/newsapp_images/cate.jpeg',
      'assets/images/newsapp_images/cate2.jpeg',
      'assets/images/newsapp_images/search.jpeg',
      'assets/images/newsapp_images/sidemenu.jpeg',
      'assets/images/newsapp_images/privacy.jpeg',
      'assets/images/newsapp_images/share.jpeg',
    ],
    'title': 'News App',
    'description':
        'Stay updated with the latest headlines! A clean and fast Flutter news app with real-time news, dark mode, and sharing features.',
    'githubUrl': 'https://github.com/HumairaNazir/newsapp',
    'apkUrl':
        'https://drive.google.com/file/d/1LRpxIqJDNlopav3551ihqC0UB1x2dPDJ/view?usp=sharing',
  },
  {
    'images': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/profile.png',
    ],
    'title': 'Recipe App',
    'description': 'Built with Firebase and Provider.',
    'githubUrl': 'https://github.com/yourusername/recipe_app',
    'apkUrl': 'https://yourwebsite.com/recipe_app.apk',
  },
  {
    'images': [
      'assets/images/logo.png',
      'assets/images/profile.png',
      'assets/images/profile.png',
    ],
    'title': 'E-commerce App',
    'description': 'Built with Flutter and Stripe payment integration.',
    'githubUrl': 'https://github.com/yourusername/ecommerce_app',
    'apkUrl': 'https://yourwebsite.com/ecommerce_app.apk',
  },
];
