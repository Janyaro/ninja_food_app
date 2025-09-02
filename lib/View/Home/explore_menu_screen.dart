import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_menucard.dart';
import 'package:food_app/widget/reuse_textform.dart';

class ExploreMenuScreen extends StatefulWidget {
  const ExploreMenuScreen({super.key});

  @override
  State<ExploreMenuScreen> createState() => _ExploreMenuScreenState();
}

class _ExploreMenuScreenState extends State<ExploreMenuScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Find Your Favorite Food',
                      style: pageheadingText,
                    ),
                  ),
                  Icon(Icons.notifications),
                ],
              ),
              const SizedBox(height: 10),

              // Search bar + filter icon
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReuseTextform(
                        title: 'What do you want to order',
                        controller: searchController,
                        color: const Color.fromARGB(255, 253, 228, 197),
                      ),
                    ),
                  ),
                  Image.asset('images/Filter_icon.png'),
                ],
              ),

              const Text(
                'Popular Menu',
                style: secondrybodyText,
              ),
              const SizedBox(height: 20),

              // ✅ Wrap StreamBuilder in Expanded
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('menu')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No menu items found.'));
                    }

                    final menuItems = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final data = menuItems[index].data();
                        return ReuseMenucard(
                          title: data['name'] ?? 'No Title',
                          description: data['desc'] ?? 'No Description',
                          Price: data['price'] ?? 0.00,
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
