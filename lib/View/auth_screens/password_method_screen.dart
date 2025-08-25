import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class PasswordMethodScreen extends StatefulWidget {
  const PasswordMethodScreen({super.key});

  @override
  State<PasswordMethodScreen> createState() => _PasswordMethodScreenState();
}

class _PasswordMethodScreenState extends State<PasswordMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 30,),
             const Text('Forget password' , style: pageheadingText,),
             const SizedBox(height: 3,),
             const SizedBox(
                width: 250,
                child: Text('Select which contact details should we use to reset your password')),
               const SizedBox(height: 20,),
                ListTile(
                  leading: Image.asset('images/Message_method.png'),
                  title:const Text('Via Message' , style: TextStyle(fontSize: 12 , color: Colors.grey),),
                  subtitle:const Text('********987' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                ),
               const SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset('images/Email.png'),
                  title:const Text('Via Mail' , style: TextStyle(fontSize: 12 , color: Colors.grey),),
                  subtitle:const Text('********987' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                ),
          
            ],
          ),
        ),
      ),
    );
  }
}