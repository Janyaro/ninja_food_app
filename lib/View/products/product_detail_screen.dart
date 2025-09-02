import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// Background Image (full screen)
          SizedBox(

            width: size.width,
            child: Image.asset(
              "images/detail_image.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Scrollable Body Content
          DraggableScrollableSheet(
            initialChildSize: 0.65, // starts from 65% of screen height
            minChildSize: 0.65,     // minimum height
            maxChildSize: 0.95,     // maximum height when pulled up
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
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
                            child: const Text(
                              "Popular",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Restaurant name
                      const Text(
                        "Wijie Bar and Resto",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),

                      // Location + Rating
                      const Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 18, color: Colors.green),
                          SizedBox(width: 4),
                          Text("19 Km  •  "),
                          Icon(Icons.star,
                              size: 18, color: Colors.orange),
                          SizedBox(width: 4),
                          Text("4.8 Rating"),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Description
                      const Text(
                        "Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. "
                        "We offer all of these options as well in our online shop, but there is nothing like getting the whole...",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 20),

                      // Popular Menu title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Popular Menu",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text("View All",
                              style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Horizontal menu list
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 140,
                              margin: const EdgeInsets.only(right: 16),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("images/Image.png",
                                      height: 60),
                                  const SizedBox(height: 10),
                                  const Text("Spacy fresh crab",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5),
                                  const Text("12 \$",
                                      style:
                                          TextStyle(color: Colors.grey)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Testimonials
                      const Text("Testimonials",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      // Single Review
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: const ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("images/Frame.png"),
                          ),
                          title: Text("Dianne Russell"),
                          subtitle: Text(
                              "It’s great. So delicious! You must try it."),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Colors.green),
                              SizedBox(width: 4),
                              Text("5"),
                            ],
                          ),
                        ),
                      ),
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
    );
  }
}
