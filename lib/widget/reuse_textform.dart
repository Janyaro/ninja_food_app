import 'package:flutter/material.dart';

class ReuseTextform extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final String? prefix_image;
  final String? sufix_image;
  const ReuseTextform(
      {super.key, required this.title, required this.controller , this.prefix_image , this.sufix_image});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        hintText: title,
        fillColor: Colors.white,
        filled: true,
         prefixIcon: prefix_image != null ? Image.asset(prefix_image!) : null,
        suffixIcon: sufix_image != null ? Image.asset(sufix_image!) : null,
        border: OutlineInputBorder(
            borderSide:BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: .5
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
