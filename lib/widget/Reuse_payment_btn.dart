import 'package:flutter/material.dart';

class ReusePaymentBtn extends StatelessWidget {
  final String payment_image;
  final double height;
  final VoidCallback ontap;
  const ReusePaymentBtn({super.key, required this.payment_image , this.height = 60, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
                    width: double.infinity,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                    ),
                    child: Center(
                      child: Image.asset(payment_image),
                    ),
                  ),
    );
  }
}