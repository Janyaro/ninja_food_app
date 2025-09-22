import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/Frame.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('Spacy fresh crab', style: secondrybodyText , maxLines: 1,),
                  Text(
                    'Spacy fresh crab',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text('\$54', style: greenbodyText),
                ],
              ),
            ),
            Center(
              child: ReuseBtn(
                title: 'Process',
                ontap: () {},
                width: 80,
                height: 30,
                radius: 50,
                fontsize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}