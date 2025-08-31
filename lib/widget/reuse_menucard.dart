import 'package:flutter/material.dart';

class ReuseMenucard extends StatelessWidget {
  final String title;
  final String description;
  final double Price;
  const ReuseMenucard({super.key , required this.title , required this.description , required this.Price});

  @override
  Widget build(BuildContext context) {
    return  Card(
  child: SizedBox(
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12), // circular radius
            child: Image.asset(
              'images/Illustration.png',
              width: 100,
              fit: BoxFit.cover, // fills the square
            ),
          ),
        ),

        // Flexible text section
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                title,
                style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold  ),
              ),
              const SizedBox(height: 4),
              Text(description , style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),

        // Price
        Flexible(
  child: Text(
    '\$ $Price',           
    maxLines: 1,           
    overflow: TextOverflow.ellipsis, 
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.orange,
      fontSize: 25,
    ),
  ),
),

      ],
    ),
  ),
)
;
  }
}