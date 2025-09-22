import 'package:flutter/material.dart';

class ReuseTextform extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final String? prefix_image;
  final IconButton? suffixiconbutton;
  final Color? color; // Changed to nullable Color?
   final bool isVisibility;
  const ReuseTextform({
    super.key, 
    required this.title, 
    required this.controller, 
    this.prefix_image, 
    this.suffixiconbutton, 
    this.color, // Removed default value
    this.isVisibility = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isVisibility,
      controller: controller,
      decoration: InputDecoration(
        
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        hintText: title,
        fillColor: color ?? Colors.white, // Handle null case here
        filled: color != null, // Only fill if color is provided
        prefixIcon: prefix_image != null 
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  prefix_image!,
                  width: 20,
                  height: 20,
                ),
              )
            : null,
        suffixIcon:suffixiconbutton ,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}