import 'package:flutter/material.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/onboarding_screens/onboardingtwo_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2) , (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingtwoScreen()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
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