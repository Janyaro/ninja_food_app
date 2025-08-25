import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/Reuse_payment_btn.dart';
import 'package:food_app/widget/reuse_btn.dart';

class PaymentmethodScreen extends StatefulWidget {
  const PaymentmethodScreen({super.key});

  @override
  State<PaymentmethodScreen> createState() => _PaymentmethodScreenState();
}

class _PaymentmethodScreenState extends State<PaymentmethodScreen> {
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
                const ReusePaymentBtn(payment_image: 'images/paypal_logo.png'),
                const SizedBox(height: 20,),
                const ReusePaymentBtn(payment_image: 'images/visa_logo.png'),
                const SizedBox(height: 20,),
               const ReusePaymentBtn(payment_image: 'images/Payoneer_logo.png'),
                const Spacer(),
                Center(child: ReuseBtn(title: 'Next', ontap: (){})),
                const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}