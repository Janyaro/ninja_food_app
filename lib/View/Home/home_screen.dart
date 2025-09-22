import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Models/menu_item.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/Home/explore_menu_screen.dart';
import 'package:food_app/View/Home/explore_resturant_screen.dart';
import 'package:food_app/View/products/detail_menu_screen.dart';
import 'package:food_app/View/products/product_detail_screen.dart';
import 'package:food_app/View/rate_food_screens/notification_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/carousal_items.dart';
import 'package:food_app/widget/reuse_textform.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(
                      width: 250.w,
                      child:const Text(
                        'Find Your Favorite Food',
                        style: pageheadingText,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationScreen()),
                        );
                      },
                    ),
                  ],
                ),

                /// Search Bar
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReuseTextform(
                          title: 'What do you want to order',
                          controller: searchController,
                          color: thememode.isDarkMode
                              ? const Color.fromARGB(221, 46, 45, 45)
                              : const Color.fromARGB(255, 253, 228, 197),
                        ),
                      ),
                    ),
                    Image.asset('images/Filter_icon.png'),
                  ],
                ),

                 SizedBox(height: 6.h),

                /// Deal Banner
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    height: 140.h,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage("images/Image.png" ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         SizedBox(
                          width: 200.w,
                          child:const Text(
                            'Special deal for October',
                            style: secondrybodyText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                         SizedBox(height: 4.h),
                        Padding(
                          padding: const EdgeInsets.only(right: 37),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 110.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Nearest Restaurant Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nearest Restaurant', style: secondrybodyText),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ExploreRestaurantScreen()),
                        );
                      },
                      child: const Text(
                        'view more',
                        style: TextStyle(fontSize: 13, color: Colors.orange),
                      ),
                    ),
                  ],
                ),

                /// Restaurant Carousel
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("restaurants")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No items available"));
                    }

                    final items = snapshot.data!.docs;

                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 160,
                        viewportFraction: 0.4,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: false,
                        padEnds: false,
                      ),
                      items: items.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        return CarousalCard(
                          data: data,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsScreen(productData: data),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                ),

                 SizedBox(height: 10.h),

                /// Popular Menu Section
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

                /// Popular Menu List
                StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("menu").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No items available"));
                    }

                    final items = snapshot.data!.docs;

                    return SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = items[index].data() as Map<String, dynamic>;
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMenuScreen(menuItem: MenuItem.fromJson(data))));
                            },
                            child: Card(
                              
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    data['imageUrl'] ?? '',
                                    height: 40.h,
                                    width: 40.w,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.broken_image,
                                            size: 40, color: Colors.grey),
                                  ),
                                ),
                                title: Text(
                                  maxLines: 1,
                                  data['name'] ?? '',
                                    style: const TextStyle(fontWeight: FontWeight.w600 , fontSize: 20)),
                                subtitle: Text(
                                  maxLines: 1,
                                  data['desc'] ?? ''),
                                trailing: Text(
                                  maxLines: 1,
                                  
                                  
                                  '\$${data['price'] ?? '0'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.green),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                 SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
