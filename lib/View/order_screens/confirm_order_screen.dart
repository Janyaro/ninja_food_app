import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Confirm Order',
                style: pageheadingText,
              ),
              const SizedBox(height: 20),
              Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Deliver To',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                      TextButton(
                          onPressed: () {},
                          child:const Text(
                            'Edit',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ))
                    ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding:const  EdgeInsets.all(13),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.amber),
                        child: Image.asset(
                          'images/Show.png',
                          color: Colors.white,
                        )),
                   const  SizedBox(
                      width: 4,
                    ),
                   const  Expanded(
                        child: Text(
                      '4517 Washington Ave. Manchester, Kentucky 39495',
                      style: secondrybodyText,
                    ))
                  ],
                )
              ]),
              SizedBox(height: 10,),
              Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Payment Method',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                      TextButton(
                          onPressed: () {},
                          child:const Text(
                            'Edit',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ))
                    ]),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding:const  EdgeInsets.all(13),
                        decoration: const BoxDecoration(
                          
                          ),
                        child: Image.asset(
                          
                          'images/Paypal.png', 
                          
                        )),
                   const  SizedBox(
                      width: 4,
                    ),
                  const Text('****39495',style: secondrybodyText)
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
