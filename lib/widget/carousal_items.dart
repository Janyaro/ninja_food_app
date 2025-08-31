import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarousalItems extends StatelessWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> items;

  const CarousalItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
   return CarouselSlider(
  options: CarouselOptions(
    height: 250, // ✅ Fixed height prevents overflow
    viewportFraction: 0.7,
    enableInfiniteScroll: false,
    enlargeCenterPage: true,
  ),
  items: items.map((doc) {
    final data = doc.data();
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                'images/Illustration.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:  15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      data['name'] ?? "Unknown",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${data['etaMins'] ?? '-'} mins",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }).toList(),
);

   }
}
