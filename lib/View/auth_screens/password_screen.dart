import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void resetPassword() async {
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(password);
        await FirebaseAuth.instance.signOut();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password successfully reset. Please login again.")),
        );

        Navigator.popUntil(context, (route) => route.isFirst); // Go back to login/signup screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No user logged in")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error resetting password: $e")),
      );
    }
  }

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
              const Text('Reset your password here', style: pageheadingText),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: Text('Enter your new password below'),
              ),
              const SizedBox(height: 30),

              ReuseTextform(
                title: 'Password',
                controller: passwordController,
                suffixiconbutton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
              ),

              const SizedBox(height: 10),

              ReuseTextform(
                title: 'Confirm Password',
                controller: confirmpasswordController,
                suffixiconbutton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
              ),

              const Spacer(),

              Center(
                child: ReuseBtn(
                  title: 'Reset Password',
                  ontap: resetPassword,
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
