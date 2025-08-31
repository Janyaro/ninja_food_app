import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_textform.dart';
import 'package:food_app/widget/text_btn.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Find Your Favorite Food',
                      style: pageheadingText,
                    ),
                  ),
                  Icon(Icons.notifications)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ReuseTextform(
                prefix_image: 'images/Icon_search.png',
                title: 'What do you want to order',
                controller: searchController,
                color: const Color.fromARGB(255, 253, 228, 197),
              ),
             const SizedBox(
                height: 10,
              ),
              const Text(
                'Type',
                style: secondrybodyText,
              ),
              const SizedBox(
                height: 12,
              ),
              const Flexible(
                child: Wrap(
                  spacing: 15, // horizontal space between buttons
                  runSpacing: 10, // vertical space between rows
                  children: [
                    TextBtn(title: "Cake"),
                    TextBtn(title: "Soap"),
                    TextBtn(title: "Main Course"),
                  ],
                ),
              ),
             const  SizedBox(
                height: 10,
              ),
             const  Text(
                'Location',
                style: secondrybodyText,
              ),
              const SizedBox(
                height: 12,
              ),
             const  Flexible(
                child: Wrap(
                  spacing: 15, // horizontal space between buttons
                  runSpacing: 10, // vertical space between rows
                  children: [
                    TextBtn(title: "Cake"),
                    TextBtn(title: "Soap"),
                    TextBtn(title: "Main Course"),
                  ],
                ),
              ),
             const  SizedBox(
                height: 10,
              ),
             const  Text(
                'Food',
                style: secondrybodyText,
              ),
              const SizedBox(
                height: 12,
              ),
             const  Flexible(
                child: Wrap(
                  spacing: 15, // horizontal space between buttons
                  runSpacing: 10, // vertical space between rows
                  children: [
                    TextBtn(title: "Cake"),
                    TextBtn(title: "Soap"),
                    TextBtn(title: "Main Course"),
                    TextBtn(title: "Dessert"),
                    TextBtn(title: "Appetizer"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
