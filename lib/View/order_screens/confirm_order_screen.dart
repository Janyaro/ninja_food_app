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
    return const SafeArea(
      child:  Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('Confirm Order' , style: pageheadingText,)
            ],
          ),
        ),
      ),
    );
  }
}