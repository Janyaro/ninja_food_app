import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/View/Home/explore_menu_screen.dart';
import 'package:food_app/View/Home/explore_resturant_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/carousal_items.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReuseTextform(
                          title: 'What do you want to order',
                          controller: searchController,
                          color: Color.fromARGB(255, 253, 228, 197),
                        ),
                      ),
                    ),
                    Image.asset('images/Filter_icon.png'),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/Image.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 200,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Special deal for October',
                            style: secondrybodyText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.only(right: 37),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 110,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(child: Text('Buy Now')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nearest Restaurant', style: secondrybodyText),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> ExploreRestaurantScreen()));
                      },
                      child: const Text(
                        'view more',
                        style: TextStyle(fontSize: 13, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("menu").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No items available"));
                    }
                    final items = snapshot.data!.docs;
                    return CarousalItems(items: items);
                  },
                ),
            
                // Menu items 
                 const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular Menu', style: secondrybodyText),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreMenuScreen()));
                      },
                      child: const Text(
                        'view more',
                        style: TextStyle(fontSize: 13, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("menu").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No items available"));
                    }
                    final items = snapshot.data!.docs;
                    return CarousalItems(items: items);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
