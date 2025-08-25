import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/paymentmethod_screen.dart';
import 'package:food_app/View/auth_screens/signin_screens.dart';
import 'package:food_app/View/auth_screens/signinprocess_one_screen.dart';
import 'package:food_app/View/auth_screens/uploadedpreview_screen.dart';
import 'package:food_app/View/auth_screens/uploadphoto_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadedpreviewScreen(),
    );
  }
}