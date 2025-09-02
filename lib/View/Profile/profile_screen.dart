import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/order_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override   
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "images/detail_image.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Draggable content
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Membership Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 232, 209),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Member Gold',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Name + Edit Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Anam Wusono',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, color: Colors.green, size: 30),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      /// Email
                      const Text(
                        'anamwp66@gmail.com',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),

                      const SizedBox(height: 20),

                      /// Voucher Row
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset("images/Pattern.png", height: 40),
                            const SizedBox(width: 12),
                            Text(
                              "You Have 3 Vouchers",
                              style: secondrybodyText,
                            ),
                          ],
                        ),
                      ),
                      Text('Favourite' , style: secondrybodyText,),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context , item){
                        return OrderCard();
                      })
                      
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
