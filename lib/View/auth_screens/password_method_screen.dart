import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/View/auth_screens/emailverfication_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class PasswordMethodScreen extends StatefulWidget {
  const PasswordMethodScreen({super.key});

  @override
  State<PasswordMethodScreen> createState() => _PasswordMethodScreenState();
}

class _PasswordMethodScreenState extends State<PasswordMethodScreen> {
final authservice = AuthService();
  String phoneNumber = "+6282045****"; // ← You should load this from Firestore user profile
  String email = "user@gmail.com";     // ← Also load this from Firestore

  String selectedMethod = "";

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text('Forget password', style: pageheadingText),
              const SizedBox(height: 3),
              const SizedBox(
                width: 250,
                child: Text('Select which contact details should we use to reset your password'),
              ),
              const SizedBox(height: 20),

              // 📱 Phone Method
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = "phone";
                  });
                },
                leading: Image.asset('images/Message_method.png'),
                title: const Text('Via Message', style: TextStyle(fontSize: 12, color: Colors.grey)),
                subtitle: Text(phoneNumber, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                selected: selectedMethod == "phone",
              ),
              const SizedBox(height: 10),

              // 📧 Email Method
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = "email";
                  });
                },
                leading: Image.asset('images/Email.png'),
                title: const Text('Via Mail', style: TextStyle(fontSize: 12, color: Colors.grey)),
                subtitle: Text(email, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                selected: selectedMethod == "email",
              ),

              const Spacer(),

              Center(
                child: ReuseBtn(
                  title: 'Next',
                  ontap: () {
                    if (selectedMethod == "email") {
                     authservice.sendEmailReset(context, email);
                    } else if (selectedMethod == "phone") {
                      authservice.sendPhoneOtp(context , phoneNumber);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a method")),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
