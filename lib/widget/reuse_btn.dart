import 'package:flutter/material.dart';

class ReuseBtn extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final Color? colors;
  final double? width;
  final double? height;
  final double? fontsize;
  final double? radius;
  
  const ReuseBtn({super.key ,required this.title ,required this.ontap , this.colors ,this.width , this.height, this.fontsize, this.radius});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(   
            width: width ?? 157,
            height: height ?? 57  ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 15),
              color: colors ??  Colors.green.shade600
            ),
            child: Center(child: Text(title , style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:fontsize ?? 22,
              color: colors != null ? Colors.green.shade600 : Colors.white
            ),),),
          ),
    );
  }
}