import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/View/auth_screens/set_location_screen.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Upload your photo profile',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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

              // gallery button
              ElevatedButton.icon(
                onPressed: _pickFromGallery,
                icon: const Icon(Icons.photo),
                label: const Text("Pick from Gallery"),
              ),

              const SizedBox(height: 10),

              // camera button
              ElevatedButton.icon(
                onPressed: _pickFromCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Take a Photo"),
              ),

              const Spacer(),

              ReuseBtn(
                title: 'Next',
                ontap: () {
                  if (_selectedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select an image")),
                    );
                    return;
                  }
                  // 👉 Pass image path forward to next screen
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SetLocationScreen(
                    image: _selectedImage!.path ?? '', 
                    username: widget.username, 
                    email: widget.email, 
                    password: widget.password, 
                    firstname: widget.firstname, 
                    lastname: widget.lastname, 
                    phoneNumber: widget.phoneNumber, 
                    paymentMethod: widget.paymentMethod)));
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
