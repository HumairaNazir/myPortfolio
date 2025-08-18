import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Me',
              style: GoogleFonts.poppins(
                  color: Colors.amber,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            'I am Humaira Nazir, a dedicated Flutter developer with 2 years of experience building high-performance mobile apps. I am passionate about writing clean code, exploring new technologies, and delivering outstanding user experiences.',
            style: GoogleFonts.poppins(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
