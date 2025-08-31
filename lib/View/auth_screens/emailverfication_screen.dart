import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/password_method_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatelessWidget {
  final String verificationId;
  const EmailVerificationScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Email Verification"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter 4 digit verification code",
              style: pageheadingText,
            ),
            const SizedBox(height: 10),
           const SizedBox(width: 280,
            child: Text(
              textAlign: TextAlign.start,
            'Code send to +6282045**** . This code will expired in 01:30'),),
            const SizedBox(height: 10,),

            // PIN Input
            PinCodeTextField(
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              onCompleted: (code) {
                print("Entered Code: $code");
              },
            ),

            const SizedBox(height: 20),
            const Spacer(),
            Center(child: ReuseBtn(title: 'Next' ,ontap:(){
              
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PasswordMethodScreen())); 
            })),
const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
