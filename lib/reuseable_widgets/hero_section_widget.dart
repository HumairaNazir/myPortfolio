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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Humaira Nazir',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Flutter Developer | 2 Years Experience',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
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
                            _launchURL('mailto:humairanazir77@gmail.com'),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
