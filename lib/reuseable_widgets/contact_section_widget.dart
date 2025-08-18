import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSectionWidget extends StatelessWidget {
  const ContactSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact',
              style: GoogleFonts.poppins(
                  color: Colors.amber,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            'Feel free to reach out via email or LinkedIn. I’m always open to freelance projects and collaborations!',
            style: GoogleFonts.poppins(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
