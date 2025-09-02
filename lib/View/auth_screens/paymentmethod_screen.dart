import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/uploadphoto_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/Reuse_payment_btn.dart';
import 'package:food_app/widget/reuse_btn.dart';

class PaymentmethodScreen extends StatefulWidget {
  final String username , email , password , firstname , lastname , phoneNumber; 
  const PaymentmethodScreen({super.key, required this.username, required this.email, required this.password, required this.firstname, required this.lastname, required this.phoneNumber});

  @override
  State<PaymentmethodScreen> createState() => _PaymentmethodScreenState();
}

class _PaymentmethodScreenState extends State<PaymentmethodScreen> {
 String paymentMethod = '' ;
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child:  Scaffold(
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 25,),
             const Text('Payment Method' , style: pageheadingText,),
             const SizedBox(height: 15,),
             const SizedBox(
                width: 300,
                child: Text('This data will be displayed in your account profile for security' , style: TextStyle(fontSize: 15),)),
               const SizedBox(height: 20,),
                 ReusePaymentBtn(ontap: (){
                  setState(() {
                    paymentMethod = 'paypal';
                  });
                 }, payment_image: 'images/Paypal.png'),
                const SizedBox(height: 20,),
                 ReusePaymentBtn(ontap: (){
                  setState(() {
                    paymentMethod = 'paypal';
                  });
                 } , payment_image: 'images/visa_logo.png'),
                const SizedBox(height: 20,),
                ReusePaymentBtn(ontap: (){
                  setState(() {
                    paymentMethod = 'paypal';
                  });
                },payment_image: 'images/Payoneer_logo.png'),
                const Spacer(),
                Center(child: ReuseBtn(title: 'Next', ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadphotoScreen(
                    username: widget.username, 
                    email: widget.email, 
                    password: widget.password, 
                    firstname: widget.firstname, 
                    lastname: widget.lastname, 
                    phoneNumber: widget.phoneNumber, 
                    paymentMethod: paymentMethod)));

                })),
                const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}