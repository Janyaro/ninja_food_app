import 'package:flutter/material.dart';

class ReuseBtn extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  
  const ReuseBtn({super.key ,required this.title ,required this.ontap });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(   
            width: 157,
            height: 57  ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green.shade600
            ),
            child: Center(child: Text(title , style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white
            ),),),
          ),
    );
  }
}