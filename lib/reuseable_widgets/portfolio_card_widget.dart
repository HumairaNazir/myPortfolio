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
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description),
          ],
        ),
      ),
    ),
  );
}
