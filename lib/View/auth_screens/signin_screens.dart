import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/Provider/payment_provider.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/auth_screens/bio_screen.dart';
import 'package:food_app/View/auth_screens/signup_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';
import 'package:provider/provider.dart';

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
    final thememode = Provider.of<ThemeProvider>(context);
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: (){
        thememode.toggleTheme();
      }, icon: thememode.isDarkMode ? Icon(Icons.brightness_5_outlined) : Icon(Icons.dark_mode)) ],),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Center(child: Image.asset('images/Log.png' , width: 200,)),
              const Text('Food Ninja' , style:headingText,),
              const Text('Be healthy be Happy', style: bodyText,),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.0),
                child:  Text('Login To Your Account' , style:secondryText,),
              ),
                ReuseTextform(
                  prefix_image: 'images/Profile.png',
                  title: 'username', controller: usernameController),
             
              SizedBox(height: 10.w,),
            
              ReuseTextform(
                prefix_image: 'images/Message.png',
                title: 'Email', controller: emailController),
               SizedBox(height: 10.w,),
              ReuseTextform(
                prefix_image: 'images/Lock.png',
                title: 'Password', 
                controller: passwordController,
                suffixiconbutton: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),),
               SizedBox(height: 10.w,),
            Row(
              children: [
               const Icon(Icons.check_circle , color: Colors.green,),
                SizedBox(width: 10.w,),
               const Text('Keep me sign in ' , style:TextStyle(fontSize: 14 , color: Colors.grey),)
              ],
            ),
            SizedBox(height: 10.h,),
             Row(
              children: [
              const  Icon(Icons.check_circle , color: Colors.green,),
                SizedBox(width: 10.w,),
              const  Text('Email me about special pricing ' , style:TextStyle(fontSize: 14 , color: Colors.grey),)
              ],
            ),
          const Spacer(),
           ReuseBtn(title: 'Login' , ontap: (){
            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ChangeNotifierProvider.value(
      value: Provider.of<PaymentProvider>(context, listen: false),
      child: BioScreen(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    ),
  ),
);

           },),
            SizedBox(height: 10.h,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const  SignupScreen()));
              }, child:Text('Already have an account' , style: greenbodyText)),
           
                
            ],
          ),
        ),
      ),
    );
  }
}