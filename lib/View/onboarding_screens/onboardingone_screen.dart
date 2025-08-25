import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class OnboardingoneScreen extends StatefulWidget {
  const OnboardingoneScreen({super.key});

  @override
  State<OnboardingoneScreen> createState() => _OnboardingoneScreenState();
}

class _OnboardingoneScreenState extends State<OnboardingoneScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/Log.png' , width: 300,)),
          const Text('Food Ninja', style:headingText),
          const  Text('Deliever Favorite Food' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),)
        ],
      ),
    );
  }
}