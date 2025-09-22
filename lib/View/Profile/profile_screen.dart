import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/order_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authserivce = AuthService();
  @override   
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body:authserivce.auth.currentUser == null ? Center(child: Text('N0t user Login ')):
       Stack(
        children: [
          StreamBuilder(stream: AuthService().userCollection.doc(FirebaseAuth.instance.currentUser!.uid).snapshots(), builder: (context,snapshot){
            if (!snapshot.hasData || !snapshot.data!.exists) {
      return const Center(child: CircularProgressIndicator());
    }

    var data = snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
            // height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 1,
              child: Image.network(
                
                data['avatarUrl'],
                fit: BoxFit.cover,
              ),
            ),
          );
  }),
          /// Background Image
          

          /// Draggable content
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color:thememode.isDarkMode ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Membership Badge
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 232, 209),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          child: const Text('Log out',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),),
                          onPressed: (){ 
                            authserivce.logout(context);
                          },
                        ),
                      ),

                       SizedBox(height: 20.h),

StreamBuilder(
  stream: AuthService().userCollection
      .doc(FirebaseAuth.instance.currentUser!.uid) // get current user's doc
      .snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData || !snapshot.data!.exists) {
      return const Center(child: CircularProgressIndicator());
    }

    var userData = snapshot.data!.data() as Map<String, dynamic>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                userData['name'] ?? 'No Name',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ),
            Flexible(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.green, size: 30),
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          userData['email'] ?? 'No Email',
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  },
),
                      /// Na
                      const SizedBox(height: 20),

                    // Voucher Row
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:thememode.isDarkMode ?  const Color.fromARGB(221, 46, 45, 45) : Colors.grey.shade100,
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
                            Image.asset("images/Pattern.png", height: 40 , color:thememode.isDarkMode ?  Colors.white : Colors.black,),
                            const SizedBox(width: 12),
                            Text(
                              "You Have 3 Vouchers",
                              style: secondrybodyText,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
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
