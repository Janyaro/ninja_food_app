import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String title;
  const TextBtn({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
return TextButton(
    onPressed: () {},
    child: Text(title),
    style: TextButton.styleFrom(
      foregroundColor: Colors.orange,
      backgroundColor: const Color.fromARGB(255, 251, 236, 217),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
      fontWeight: FontWeight.w500
      ),
    ),
  );
  }
}