import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/Provider/navigation_provider.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/auth_screens/set_location_screen.dart';
import 'package:food_app/View/root_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:provider/provider.dart';

class UploadphotoScreen extends StatefulWidget {
  final String username , email , password , firstname , lastname , phoneNumber , paymentMethod; 
  const UploadphotoScreen({super.key, required this.username, required this.email, required this.password, required this.firstname, required this.lastname, required this.phoneNumber, required this.paymentMethod});

  @override
  State<UploadphotoScreen> createState() => _UploadphotoScreenState();
}

class _UploadphotoScreenState extends State<UploadphotoScreen> {
  // File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFromCamera() async {
  final imageProvider = Provider.of<NavigationProvider>(context, listen: false);

  final pickedFile = await _picker.pickImage(source: ImageSource.camera);

  if (!mounted) return; // <- ensure widget is still mounted

  if (pickedFile != null) {
    imageProvider.setImage(pickedFile.path);
  }
}

Future<void> _pickFromGallery() async {
  final imageProvider = Provider.of<NavigationProvider>(context, listen: false);

  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  if (!mounted) return; // <- ensure widget is still mounted

  if (pickedFile != null) {
    imageProvider.setImage(pickedFile.path);
  }
}


  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    final imageProvider = Provider.of<NavigationProvider>(context);
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
              const Text(
                'This data will be displayed in your account profile for security',
                style: TextStyle(fontSize: 14 , color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // preview selected image
              Center(
                child: imageProvider.selectImage != null
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(imageProvider.selectImage!),
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
                  onTap: _pickFromGallery,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:thememode.isDarkMode ? const Color.fromARGB(221, 46, 45, 45) :  Colors.white,
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset:const Offset(0, 3)
                        )
                      ]
                    ),
                    child: Image.asset('images/Gallery.png' , height: 80,  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: InkWell(
                  onTap: _pickFromCamera,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: thememode.isDarkMode ? const Color.fromARGB(221, 46, 45, 45) :  Colors.white,
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
      if (imageProvider.selectImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select an image")),
        );
        return; // stop execution
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SetLocationScreen(
            image: imageProvider.selectImage!.path,
            username: widget.username,
            email: widget.email,
            password: widget.password,
            firstname: widget.firstname,
            lastname: widget.lastname,
            phoneNumber: widget.phoneNumber,
            paymentMethod: widget.paymentMethod,
          ),
        ),
      );
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
