import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final List<String> images;
  final String title;
  final String description;
  final String? githubUrl;
  final String? apkUrl;

  const ProjectCard({
    super.key,
    required this.images,
    required this.title,
    required this.description,
    this.githubUrl,
    this.apkUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final CarouselSliderController _controller = CarouselSliderController();

  void _openFullScreenCarousel(int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenCarousel(
          images: widget.images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  Widget _buildImage(String image) {
    if (image.startsWith("http")) {
      return Image.network(image, fit: BoxFit.fitWidth);
    } else {
      return Image.asset(image, fit: BoxFit.fitWidth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: widget.images.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final image = widget.images[index];
                    return GestureDetector(
                      onTap: () => _openFullScreenCarousel(index),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                              alignment: Alignment.topCenter,
                              child: _buildImage(image),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Left Arrow
                Positioned(
                  left: 8,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        size: 28, color: Colors.orange),
                    onPressed: () => _controller.previousPage(),
                  ),
                ),
                // Right Arrow
                Positioned(
                  right: 8,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        size: 28, color: Colors.orange),
                    onPressed: () => _controller.nextPage(),
                  ),
                ),
              ],
            ),

            // ✅ Title & Description
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            // ✅ GitHub & APK buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available on :",
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.amber),
                  ),
                  const SizedBox(width: 8),
                  if (widget.githubUrl != null)
                    IconButton(
                      onPressed: () => _launchURL(widget.githubUrl!),
                      icon: const FaIcon(FontAwesomeIcons.github,
                          color: Colors.white),
                    ),
                  if (widget.apkUrl != null)
                    IconButton(
                      onPressed: () => _launchURL(widget.apkUrl!),
                      icon: const FaIcon(FontAwesomeIcons.download,
                          color: Colors.greenAccent),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ Fullscreen Carousel Page
class FullScreenCarousel extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenCarousel({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  Widget _buildImage(String image) {
    if (image.startsWith("http")) {
      return Image.network(image, fit: BoxFit.contain);
    } else {
      return Image.asset(image, fit: BoxFit.contain);
    }
  }

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController controller = CarouselSliderController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            carouselController: controller,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              initialPage: initialIndex,
              enableInfiniteScroll: true,
            ),
            itemBuilder: (context, index, realIndex) {
              return Center(child: _buildImage(images[index]));
            },
          ),
          // Left Arrow
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.orange, size: 32),
              onPressed: () => controller.previousPage(),
            ),
          ),
          // Right Arrow
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Colors.orange, size: 32),
              onPressed: () => controller.nextPage(),
            ),
          ),
          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.orange, size: 32),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ Helper function
void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
