import 'package:flutter/material.dart';
import 'package:food_app/Models/user_model.dart';
import 'package:food_app/Provider/navigation_provider.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/View/auth_screens/signin_screens.dart';
import 'package:food_app/View/auth_screens/signup_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class SetLocationScreen extends StatefulWidget {
  final String username,
      email,
      password,
      firstname,
      lastname,
      phoneNumber,
      paymentMethod,
      image;

  const SetLocationScreen({
    super.key,
    required this.image,
    required this.username,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
    required this.paymentMethod,
  });

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  final authservice = AuthService();
  // Position? _currentPosition;

  Future<void> _getCurrentLocation() async {
    final locationProvider = Provider.of<NavigationProvider>(context , listen: false);
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location services are disabled. Please enable them.'),
          ),
        );
        return;
      }

      // Check permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied.')),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location permission permanently denied. Please enable it from Settings.',
            ),
          ),
        );
        return;
      }

      // If everything is okay → get position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      locationProvider.setPosition(position);
      

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Location set: ${position.latitude}, ${position.longitude}',
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting location: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<NavigationProvider>(context);
    final thememode = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
                Text( 'Set your location', style: pageheadingText)  ,
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: Text(
                  'This data will be displayed in your account profile for security',
                ),
              ),
              const SizedBox(height: 20),
               Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.yellow, size: 50),
                 const SizedBox(width: 10),
                 locationProvider.currentPosition != null ? Flexible(child: Text('Lat ${locationProvider.currentPosition!.latitude} : Log ${locationProvider.currentPosition!.longitude}' ,  style: secondrybodyText)): Text('Your Location', style: secondrybodyText),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _getCurrentLocation,
                child: Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    color:thememode.isDarkMode ? const Color.fromARGB(221, 46, 45, 45) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Set Location',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Show preview if location set
              

              const Spacer(),
              Center(
                child: ReuseBtn(
                  title: 'Next',
                  ontap: () async {
                    if (locationProvider.currentPosition == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please set your location first'),
                        ),
                      );
                      return; // stop execution
                    }

                    await authservice.saveUserData(
                      UserModel(
                        name: widget.username,
                        email: widget.email,
                        password: widget.password,
                        firstName: widget.firstname,
                        lastName: widget.lastname,
                        phone: widget.phoneNumber,
                        paymentMethod: widget.paymentMethod,
                        avatarUrl: widget.image,
                        address: locationProvider.currentPosition.toString(),
                      ),
                    ).then((val) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User created Successfully'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    });
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
