import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // breakpoint
              bool isMobile = constraints.maxWidth < 800;

              if (isMobile) {
                // 📱 Mobile → Column layout
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfile(),
                    const SizedBox(height: 30),
                    _buildLogo(),
                  ],
                );
              } else {
                // 💻 Desktop  Row layout
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildProfile()),
                    Expanded(child: _buildLogo()),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Flutter Developer | 2 Years Experience',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.linked_camera, color: Colors.white),
              onPressed: () =>
                  _launchURL('https://www.linkedin.com/in/your-profile'),
            ),
            IconButton(
              icon: const Icon(Icons.code, color: Colors.white),
              onPressed: () => _launchURL('https://github.com/your-github'),
            ),
            IconButton(
              icon: const Icon(Icons.mail, color: Colors.white),
              onPressed: () => _launchURL('mailto:humairanazir77@gmail.com'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo.png',
      height: 150,
      fit: BoxFit.contain,
    );
  }
}

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
