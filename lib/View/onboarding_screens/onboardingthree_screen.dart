import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/signup_screen.dart';
import 'package:food_app/widget/reuse_btn.dart';

class OnboardingthreeScreen extends StatefulWidget {
  const OnboardingthreeScreen({super.key});

  @override
  State<OnboardingthreeScreen> createState() => _OnboardingthreeScreenState();
}

class _OnboardingthreeScreenState extends State<OnboardingthreeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('images/Illustration.png'),
      const SizedBox(
          width: 500,
          child: Text(
            textAlign: TextAlign.center,
            'Food Ninja is Where Your Comfort Food Lives',
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
            'Enjoy a fast and smooth food delivery at your doorstep',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Spacer(),
        ReuseBtn(title: 'Next',ontap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
        },),
        SizedBox(height: 30,)
      ],
    ),
    );
  }
}