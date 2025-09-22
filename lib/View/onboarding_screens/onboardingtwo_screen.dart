import 'package:flutter/material.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/onboarding_screens/onboardingthree_screen.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OnboardingtwoScreen extends StatefulWidget {
  const OnboardingtwoScreen({super.key});

  @override
  State<OnboardingtwoScreen> createState() => _OnboardingtwoScreenState();
}

class _OnboardingtwoScreenState extends State<OnboardingtwoScreen> {
  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    return  Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        thememode.toggleTheme();
      }, icon: thememode.isDarkMode ? const Icon(Icons.brightness_5_outlined) : const Icon(Icons.dark_mode)) ],),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('images/Illustartion1.png'),
       SizedBox(
          width: 300.w,
          child:const Text(
            textAlign: TextAlign.center,
            'Find your Comfort Food here',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
         SizedBox(
          width: 300.w,
          child: Text(
            textAlign: TextAlign.center,
            'Here You Can find a chef or dish for every taste and color. Enjoy!',
            style: TextStyle(color: Colors.grey ),
          ),
        ),
       const Spacer(),
        ReuseBtn(title: 'Next',ontap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingthreeScreen()));
        },),
        SizedBox(height: 30.w,)
      ],
    ),
    );
  }
}