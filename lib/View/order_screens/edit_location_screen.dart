import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/Services/data_services.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:geolocator/geolocator.dart';

class EditLocationScreen extends StatefulWidget {
  const EditLocationScreen({super.key});

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  
  final authservice = AuthService();
  Position? _currentPosition;

  Future<void> _getCurrentLocation() async {
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

      setState(() {
        _currentPosition = position;
      });

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
  final dataservice = DataServices();
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Shipping' , style: pageheadingText,),
            const SizedBox(height: 20,),
                              FutureBuilder<String>(
  future:uid != null ? dataservice.getUserLocation(uid!) : Future.value("No user"),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return const Text("Error loading location");
    }
    if (!snapshot.hasData) {
      return const Text("No location found");
    }

    return Card(
      child: Container(
        padding: const EdgeInsets.all(6),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order Location", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.location_on_rounded, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Expanded( 
                  child:snapshot.data != null ? Text(
                    snapshot.data!, // 🔥 Firestore location here
                    style: secondrybodyText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ): Text('No location is Available')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
),

             
             Card(
              child: Container(
                padding:const EdgeInsets.all(12),
                
                decoration:const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text('Deliever To' , style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:const  EdgeInsets.all(8),
                          decoration:const  BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle
                          
                          ),
                          child:const Icon(Icons.location_on_rounded , color: Colors.white,)),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                         Text(
  _currentPosition != null
      ? 'Lat ${_currentPosition!.latitude} & Long ${_currentPosition!.longitude}'
      : 'Location not set yet',
  style: secondrybodyText,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
),

                                                TextButton(onPressed: _getCurrentLocation, child:const Text('Set Location' , style: TextStyle(color: Colors.green),))
                              ],
                            ),
                          )
                      ],
                    ),
                  ],
                ),

              ),
            )
           ],
        ),
      ),
    );
  }
  
}