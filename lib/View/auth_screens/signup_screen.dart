import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/View/auth_screens/emailverfication_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Center(child: Image.asset('images/Log.png' , width: 250,)),
              const Text('Food Ninja' , style:headingText,),
              const Text('Be healthy be Happy', style: bodyText,),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.0),
                child:  Text('Login To Your Account' , style:secondryText,),
              ),
              ReuseTextform(title: 'Email', controller: emailController),
              const SizedBox(height: 10,),
              ReuseTextform(title: 'Password', controller: passwordController),
              const SizedBox(height: 10,),
              const Text('Or Continue With' , style: secondrybodyText,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      padding:const  EdgeInsets.symmetric(horizontal: 15),
                      width: 152,
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: .5
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('images/facebook.svg'),
                          const SizedBox(width: 6,),
                          const Text('Facebook' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: 152,
                            height: 57,
                            decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,   // 👈 grey border
                            width: .5,           // 👈 thickness (optional)
                          ),
                          borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                          children: [
                            SvgPicture.asset('images/google.svg'),
                            const SizedBox(width: 6),
                            const Text(
                              'Google',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                            ),
                          ),
                  )
      
                ],
              ),
             const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EmailVerificationScreen(verificationId: 'verificationId')));
              },
              child: const  Text('Forget your Password?' , style: greenbodyText,)),
           const SizedBox(height: 20,),
           ReuseBtn(title: 'Login' , ontap: (){},)
      
            ],
          ),
        ),
      ),
    );
  }
}