import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final List<String> images;
  final String title;
  final String description;

  const ProjectCard({
    super.key,
    required this.images,
    required this.title,
    required this.description,
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // ✅ keeps card size fixed so Wrap shows in grid
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(12),
        child: Column(
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
                              child: Image.asset(
                                image,
                                fit: BoxFit.fitWidth,
                              ),
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
          ],
        ),
      ),
    );
  }
}

/// ✅ Fullscreen Carousel Page
class FullScreenCarousel extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenCarousel({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<FullScreenCarousel> createState() => _FullScreenCarouselState();
}

class _FullScreenCarouselState extends State<FullScreenCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: widget.images.length,
            carouselController: _controller,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              initialPage: widget.initialIndex,
              enableInfiniteScroll: true,
              enlargeCenterPage: false,
            ),
            itemBuilder: (context, index, realIndex) {
              return Center(
                child: Image.asset(widget.images[index], fit: BoxFit.contain),
              );
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
              onPressed: () => _controller.previousPage(),
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
              onPressed: () => _controller.nextPage(),
            ),
          ),
          // Close Button
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
