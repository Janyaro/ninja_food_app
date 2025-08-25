import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/Reuse_payment_btn.dart';
import 'package:food_app/widget/reuse_btn.dart';

class UploadphotoScreen extends StatefulWidget {
  const UploadphotoScreen({super.key});

  @override
  State<UploadphotoScreen> createState() => _UploadphotoScreenState();
}

class _UploadphotoScreenState extends State<UploadphotoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Upload your photo profile' , style:TextStyle(fontSize: 35 , fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const SizedBox(
                width: 300,
                child: Text('This data will be displayed in your account profile for security' , style: TextStyle(fontSize: 15),)),
                const SizedBox(height: 10,),
                const ReusePaymentBtn(payment_image: 'images/Gallery.png' ,
                height: 150,),
                const SizedBox(height: 30,),
                const ReusePaymentBtn(payment_image: 'images/Camera.png' ,
                height: 150,),
                const Spacer(),
                ReuseBtn(title: 'Next', ontap: (){}),
                const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}