import 'package:flutter/material.dart';
import 'package:food_app/Models/user_model.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/View/auth_screens/signin_screens.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';


class SetLocationScreen extends StatefulWidget {
  final String username , email , password , firstname , lastname , phoneNumber ,paymentMethod, image; 
  const SetLocationScreen({super.key, required this.image, required this.username, required this.email, required this.password, required this.firstname, required this.lastname, required this.phoneNumber, required this.paymentMethod});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  final authservice = AuthService();
//   Position? _currentPosition;
//   Future<void> _getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Check if location services are enabled
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   // Check for permission
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, cannot request.');
//   }

//   // Get current position
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);

//   print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");

// setState(() {
//       _currentPosition = position;
//     });
// }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 20,),
             const Text('Set your location' , style: pageheadingText,),
             const SizedBox(height: 10,),
         const SizedBox(
            width: 300,
            child: Text('This data will be displayed in your account profile for security')),
           const SizedBox(height: 20,),
           const Row(
              children: [
               const Icon(Icons.location_on , color: Colors.yellow, size: 50,),
               const SizedBox(width: 10,),
               const Text('Your Location' , style: secondrybodyText,),
              ],
            ),
            const SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    // _getCurrentLocation();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:const Center(child: Text('Set Location' , style: TextStyle(fontSize: 19 , fontWeight: FontWeight.bold ),),),
                  ),
                ),
                const Spacer(),
                Center(child: ReuseBtn(title: 'Next', ontap: ()async{
                  await authservice.saveUserData(UserModel(
                    name: widget.username,
                    email: widget.email,
                    password: widget.password,
                    firstName: widget.firstname,
                    lastName: widget.lastname,
                    phone: widget.phoneNumber,
                    
                    paymentMethod: widget.paymentMethod,
avatarUrl: widget.image,
// address: _currentPosition.toString()
address: ''
                  )).then((val){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User create Successfully')));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SigninScreen()));
                  });
                })),
                const SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}