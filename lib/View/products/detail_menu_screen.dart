import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Models/menu_item.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/Services/cart_service.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:provider/provider.dart';

class DetailMenuScreen extends StatelessWidget {
  final MenuItem menuItem;
  const DetailMenuScreen({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    // ignore: non_constant_identifier_names
    final cart = CartService();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: menuItem.imageUrl.isNotEmpty
                ? Image.network(
                    menuItem.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                      menuItem.imageUrl, // Fallback image
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(
                    "images/icecream_image.jpg", // Default image
                    fit: BoxFit.cover,
                  ),
          ),

          /// Scrollable Body Content
          DraggableScrollableSheet(
            initialChildSize: 0.65, // starts from 65% of screen height
            minChildSize: 0.65, // minimum height
            maxChildSize: 0.95, // maximum height when pulled up
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color:thememode.isDarkMode ? const Color.fromARGB(221, 46, 45, 45)   :Colors.white,
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),

                      // Popular tag + heart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              menuItem.category.isNotEmpty
                                  ? menuItem.category
                                  : "Popular", // Use category or default
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Restaurant name - NOW USING ACTUAL MENU ITEM NAME
                      Text(
                        menuItem.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),

                      // Price display - ADDED THIS SECTION
                      Text(
                        "\$${menuItem.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      const SizedBox(height: 6),

                      // Location + Rating
                      const Row(
                        children: [
                          Icon(Icons.location_on, size: 18, color: Colors.green),
                          SizedBox(width: 4),
                          Text("19 Km  •  "),
                          Icon(Icons.star, size: 18, color: Colors.orange),
                          SizedBox(width: 4),
                          Text("4.8 Rating"),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Description - NOW USING ACTUAL MENU ITEM DESCRIPTION
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(

                               "No description available.", // Fallback text
                            style:  TextStyle(
                                color:thememode.isDarkMode ?Colors.white:const Color.fromARGB(221, 46, 45, 45)   , height: 1.5),
                          ),
                          SizedBox(height: 12),

                          // Ingredients list - You might want to add this to your MenuItem model
                          const Text("Ingredients:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text("Strawberry",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text("Cream",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text("Wheat",
                              style: TextStyle(fontWeight: FontWeight.bold)),

                          const SizedBox(height: 12),

                           Text(
                            "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.",
                            style: TextStyle(color:thememode.isDarkMode ?Colors.white:const Color.fromARGB(221, 46, 45, 45)  , height: 1.5),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Popular Menu title
                      const SizedBox(height: 20),

                      // Testimonials
                      const Text("Testimonials",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      // Single Review
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3, // Show 3 reviews
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: const ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/Frame.png"),
                                ),
                                title: Text("Dianne Russell"),
                                subtitle: Text(
                                    "It's great. So delicious! You must try it."),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.star, color: Colors.green),
                                    SizedBox(width: 4),
                                    Text("5"),
                                  ],
                                ),
                              ),
                            );
                          }),
                      const SizedBox(height: 50), // bottom padding
                    ],
                  ),
                ),
              );
            },
          ),

          /// Back button on top of image
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
        child: ReuseBtn(
          title: 'Add to Cart \$${menuItem.price.toStringAsFixed(2)}', // Show price in button
          ontap: () {
          cart.addCartItem(menuItem);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item add into cart')));
          },
          width: double.infinity,
          fontsize: 18,
        ),
      ),
    );
  }
}