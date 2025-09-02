import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/set_location_screen.dart';
import 'package:food_app/View/root_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_app/widget/reuse_btn.dart';

class UploadphotoScreen extends StatefulWidget {
  final String username , email , password , firstname , lastname , phoneNumber , paymentMethod; 
  const UploadphotoScreen({super.key, required this.username, required this.email, required this.password, required this.firstname, required this.lastname, required this.phoneNumber, required this.paymentMethod});

  @override
  State<UploadphotoScreen> createState() => _UploadphotoScreenState();
}

class _UploadphotoScreenState extends State<UploadphotoScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // pick image from gallery
  Future<void> _pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // pick image from camera
  Future<void> _pickFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const Text(
                'Upload your photo profile',
                style:pageheadingText
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: Text(
                  'This data will be displayed in your account profile for security',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),

              // preview selected image
              Center(
                child: _selectedImage != null
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(_selectedImage!),
                      )
                    : const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 60, color: Colors.white),
                      ),
              ),

              const SizedBox(height: 30),
               
              Center(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset:const Offset(0, 3)
                        )
                      ]
                    ),
                    child: Image.asset('images/Gallery.png' , height: 80,),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset:const Offset(0, 3)
                        )
                      ]
                    ),
                    child: Image.asset('images/Camera.png' , height: 80,),
                  ),
                ),
              ),
              const Spacer(),

              Center(
                child: ReuseBtn(
                  title: 'Next',
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RootScreen()));
                    // if (_selectedImage == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text("Please select an image")),
                    //   );
                    //   return;
                    // }
                    // // 👉 Pass image path forward to next screen
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> SetLocationScreen(
                    //   image: _selectedImage!.path ?? '', 
                    //   username: widget.username, 
                    //   email: widget.email, 
                    //   password: widget.password, 
                    //   firstname: widget.firstname, 
                    //   lastname: widget.lastname, 
                    //   phoneNumber: widget.phoneNumber, 
                    //   paymentMethod: widget.paymentMethod)));
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
