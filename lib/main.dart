import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/portfolio_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Humaira | Flutter Developer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1C),
        primaryColor: const Color(0xFFFFC107),
      ),
      home: PortfolioScreen(),
      // home: const PortfolioHomePage(),
    );
  }
}
