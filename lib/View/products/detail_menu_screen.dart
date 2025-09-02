import 'package:flutter/material.dart';
import 'package:food_app/widget/reuse_btn.dart';

class DetailMenuScreen extends StatelessWidget {
  const DetailMenuScreen({super.key});

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
              "images/icecream_image.jpg",
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
                   const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Text(
      "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. "
      "Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.",
      style: TextStyle(color: Colors.black54, height: 1.5),
    ),
    SizedBox(height: 12),

    // Ingredients list
    Text("Strawberry", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("Cream", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("Wheat", style: TextStyle(fontWeight: FontWeight.bold)),

    SizedBox(height: 12),

    Text(
      "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.",
      style: TextStyle(color: Colors.black54, height: 1.5),
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
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                        return  Card(
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
    bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom: 30 , left: 10 , right: 10) ,
    child: ReuseBtn(title: 'Add to Card', ontap: (){} , width: double.infinity,fontsize: 18,),
    ),
    );

  }
}
