import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class SuccessnotificationScreen extends StatefulWidget {
  const SuccessnotificationScreen({super.key});

  @override
  State<SuccessnotificationScreen> createState() => _SuccessnotificationScreenState();
}

class _SuccessnotificationScreenState extends State<SuccessnotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/Success.png')),
         const SizedBox(height: 6,),
          const Text('Congrats' , style: headingText,),
          const Text('Password reset succesful' , style: secondryText,),
        
        const SizedBox(height: 150,),
        ReuseBtn(title: 'Back', ontap: (){}),
        ],
      ),
    );
  }
}