import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';

class SigninprocessOneScreen extends StatefulWidget {
  const SigninprocessOneScreen({super.key});

  @override
  State<SigninprocessOneScreen> createState() => _SigninprocessOneScreenState();
}

class _SigninprocessOneScreenState extends State<SigninprocessOneScreen> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Column(
            children: [
             const SizedBox(height: 10,),
             const Text('Fill in your bio to get start' , style: pageheadingText,),
             const SizedBox(height: 10,),
             const Text('This data will be displayed in your account profile for security',style: TextStyle(fontSize: 18),),
             const SizedBox(height: 20,),
              ReuseTextform(title: 'First Name', controller: firstnameController), 
            const SizedBox(height: 15,),
            ReuseTextform(title: 'Last Name', controller: lastnameController), 
            const SizedBox(height: 15,),
            ReuseTextform(title: 'Phone Number', controller: phoneController), 
            const  Spacer(),
            ReuseBtn(title: 'Next' , ontap: (){},),
            SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}