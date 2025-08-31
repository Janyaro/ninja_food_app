import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class ExploreRestaurantScreen extends StatefulWidget {
  const ExploreRestaurantScreen({super.key});

  @override
  State<ExploreRestaurantScreen> createState() =>
      _ExploreRestaurantScreenState();
}

class _ExploreRestaurantScreenState extends State<ExploreRestaurantScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Find Your Favorite Food',
                      style: pageheadingText
                    ),
                  ),
                  Icon(Icons.notifications),
                ],
              ),
              const SizedBox(height: 10),

              // Search bar + Filter button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: "What do you want to order?",
                        fillColor: const Color.fromARGB(255, 253, 228, 197),
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, size: 30),
                    onPressed: () {
                      // TODO: Add filter logic
                    },
                  ),
                ],
              ),

              // Restaurant Grid from Firestore
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('restaurants') // Check spelling: Resurents or Restaurants?
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No restaurants found.'));
                    }

                    final docs = snapshot.data!.docs;

                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final food = docs[index].data();
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(food['logoUrl']),
                              const SizedBox(height: 10),
                              Text(
                                food['name'] ?? 'Unknown',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${food['etaMins'] ?? '-'} mins",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
