import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/Provider/navigation_provider.dart';
import 'package:food_app/Provider/payment_provider.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/onboarding_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
  MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context)=> ThemeProvider()),
    ChangeNotifierProvider(create: (context)=> NavigationProvider()),
    ChangeNotifierProvider(create: (context)=> PaymentProvider())

  ],
    child : MyApp())
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
    builder:   (context , builder){
      return MaterialApp(
       themeMode: themeProvider.themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
    );
    }
    );
  }
}