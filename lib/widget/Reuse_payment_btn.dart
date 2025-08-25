import 'package:flutter/material.dart';

class ReusePaymentBtn extends StatelessWidget {
  final String payment_image;
  final double height;
  const ReusePaymentBtn({super.key, required this.payment_image , this.height = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: double.infinity,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Image.asset(payment_image),
                  ),
                );
  }
}