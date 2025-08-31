import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  SizedBox(height: 30,),
             const  Text('Reset your password here' , style: pageheadingText,),
             const  SizedBox(height: 10,),
            const  SizedBox(
              width: 300,
              child:  Text('Select which contact details should we use to reset your password')),
             const  SizedBox(height: 30,),
              ReuseTextform(title: 'password', controller: passwordController , sufix_image: 'images/Show.png' ,),
             const  SizedBox(height: 10,),
              ReuseTextform(title: 'confirm password', controller: confirmpasswordController , sufix_image: 'images/Show.png',),
              Spacer(),
              Center(
                child: ReuseBtn(title: 'Next', ontap: (){}),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}