import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget projectCard({
  required List<String> imagePaths,
  required String title,
  required String description,
}) {
  return SizedBox(
    width: 300,
    child: Card(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel with overlay only (no text inside each image)
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: false,
              ),
              items: imagePaths.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black
                              .withValues(alpha: 0.3), // black overlay
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            // Title and description once, outside the carousel
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
