import 'package:flutter/material.dart';
import 'package:food_app/View/call_screens/voucher_promo_screen.dart';
import 'package:food_app/View/rate_food_screens/rateresturant_screen.dart';
import 'package:food_app/View/root_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';

class RatefoodScreen extends StatefulWidget {
  const RatefoodScreen({super.key});

  @override
  State<RatefoodScreen> createState() => _RatefoodScreenState();
}

class _RatefoodScreenState extends State<RatefoodScreen> {
  final feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
           Expanded(
            flex: 3,
             child: Container(
               width: 200,
               height: 200,
               decoration: BoxDecoration(
                 shape: BoxShape.circle, // make border circular
                 border: Border.all(
                   color: Colors.green,
                   width: 3, // border thickness
                 ),
                 image:const DecorationImage(
                   image: AssetImage('images/rate_image.jpg'),
                   fit: BoxFit.cover,
                 ),
               ),
             ),
           ),
         const SizedBox(
            width: 220,
            child: Text(
              textAlign: TextAlign.center,
              'Thank You! Enjoy Your Meal' , style: secondryText,),
          ),
         const SizedBox(height: 10,),
        const Text('Please rate your Food' , style: TextStyle(color: Colors.grey),),
         const  SizedBox(height: 10,),
         const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star ,size: 35,  color: Colors.amber,),
              Icon(Icons.star ,size: 35,  color: Colors.amber),
              Icon(Icons.star ,size: 35,  color: Colors.amber),
              Icon(Icons.star ,size: 35,  color: Colors.amber),
            ],
          ),
          const Spacer(),
          ReuseTextform(title: 'Leave feedback', controller: feedbackController , prefix_image: 'images/edit_icon.png',),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReuseBtn(title: 'Submit', ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RateResturantScreen()));
              } ),
            ReuseBtn(title: 'Skip', ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RootScreen()));
            } ,colors: Colors.white, ),
            ],
          ),
          const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}