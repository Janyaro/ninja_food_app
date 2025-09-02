import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/Frame.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('Spacy fresh crab', style: secondrybodyText),
                  Text(
                    'Spacy fresh crab',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text('\$54', style: greenbodyText),
                ],
              ),
            ),
            Center(
              child: ReuseBtn(
                title: 'Process',
                ontap: () {},
                width: 100,
                height: 40,
                radius: 50,
                fontsize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}