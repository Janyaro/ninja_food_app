import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(appBar: AppBar(
  leading: Align(
    
    alignment: Alignment.center,
    child: CircleAvatar(
      radius: 18,
      backgroundColor: Colors.orange[200],
      child:InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 18,
        ),
      ),
    ),
  ),
),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
             const Text('Notification' , style: pageheadingText,),
             const SizedBox(height: 10,),
              Card(
                child: ListTile( 
                leading: Image.asset('images/check_image.png'),
                title:const Text('Your order has been taken by the driver', style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle:const Text('Recently' , style: TextStyle(color: Colors.grey),),
                ),
              )
            ],
          ),
          ),
      ),
    );
  }
}