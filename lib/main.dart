import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/View/Home/explore_menu_screen.dart';
import 'package:food_app/View/Home/explore_resturant_screen.dart';
import 'package:food_app/View/Home/home_screen.dart';
import 'package:food_app/View/call_screens/user_screen.dart';
import 'package:food_app/View/call_screens/voucher_promo_screen.dart';
import 'package:food_app/View/onboarding_screens/splash_screen.dart';
import 'package:food_app/View/order_screens/confirm_order_screen.dart';
import 'package:food_app/View/order_screens/orderdetail_screen.dart';
import 'package:food_app/View/rate_food_screens/notification_screen.dart';
import 'package:food_app/View/rate_food_screens/ratefood_screen.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConfirmOrderScreen(),
    );
  }
}