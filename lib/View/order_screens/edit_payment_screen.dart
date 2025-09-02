import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class EditPaymentScreen extends StatefulWidget {
  const EditPaymentScreen({super.key});

  @override
  State<EditPaymentScreen> createState() => _EditPaymentScreenState();
}

class _EditPaymentScreenState extends State<EditPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const Text('Payment' , style: pageheadingText,),
          const SizedBox(height: 10,),
           _PaymentCard('images/Paypal.png', '*****1245'),
           const SizedBox(height: 2,),
           _PaymentCard('images/visa_logo.png', '*****1245'),
           const SizedBox(height: 2,),
           _PaymentCard('images/Payoneer_logo.png', '*****1245')
          ],
        ),
      ),
    );
  }
  static Widget _PaymentCard(String imageUrl,String number){
    return InkWell(
      onTap: (){},
      child: Card(
        child: Container(
          height: 100,
          decoration:const BoxDecoration(),
          child: Center(
            child: ListTile(
              leading: Image.asset(imageUrl),
              trailing:Text(number , style: TextStyle(fontSize: 18),),
            ),
          ),
        ),
      ),
    );
  }
}