import 'package:flutter/material.dart';
import 'package:food_app/View/onboarding_screens/onboardingthree_screen.dart';
import 'package:food_app/widget/reuse_btn.dart';

class OnboardingtwoScreen extends StatefulWidget {
  const OnboardingtwoScreen({super.key});

  @override
  State<OnboardingtwoScreen> createState() => _OnboardingtwoScreenState();
}

class _OnboardingtwoScreenState extends State<OnboardingtwoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('images/Illustartion1.png'),
      const SizedBox(
          width: 300,
          child: Text(
            textAlign: TextAlign.center,
            'Find your Comfort Food here',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(
          width: 300,
          child: Text(
            textAlign: TextAlign.center,
            'Here You Can find a chef or dish for every taste and color. Enjoy!',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ReuseBtn(title: 'Next',ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingthreeScreen()));
          },),
        )
      ],
    ),
    );
  }
}