import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/bio_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
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
                  ReuseTextform(
                    prefix_image: 'images/Profile.png',
                    title: 'username', controller: usernameController),
               
               const SizedBox(height: 10,),
              
                ReuseTextform(
                  prefix_image: 'images/Message.png',
                  title: 'Email', controller: emailController),
                const SizedBox(height: 10,),
                ReuseTextform(
                  prefix_image: 'images/Lock.png',
                  title: 'Password', 
                  controller: passwordController,
                  sufix_image: 'images/Show.png',),
                const SizedBox(height: 10,),
             const Row(
                children: [
                  Icon(Icons.check_circle , color: Colors.green,),
                  SizedBox(width: 10,),
                  Text('Keep me sign in ' , style:TextStyle(fontSize: 20 , color: Colors.grey),)
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.check_circle , color: Colors.green,),
                  SizedBox(width: 10,),
                  Text('Email me about special pricing ' , style:TextStyle(fontSize: 20 , color: Colors.grey),)
                ],
              ),
             const SizedBox(height: 20,),
             ReuseBtn(title: 'Login' , ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BioScreen(
                username:usernameController.text ,
                email: emailController.text,
                password: passwordController.text,
              )));
             },),
             const SizedBox(height: 10,),
              const  Text('Already have an account' , style: greenbodyText,),
            
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}