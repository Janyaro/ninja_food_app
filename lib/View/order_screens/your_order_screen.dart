import 'package:flutter/material.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/root_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/order_card.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';
import 'package:provider/provider.dart';

class YourOrderScreen extends StatefulWidget {
  const YourOrderScreen({super.key});

  @override
  State<YourOrderScreen> createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
           const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Flexible(
                  child: Text(
                    'Find Your Favorite Food',
                    style: pageheadingText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.notifications),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ReuseTextform(
                    title: 'What you want to Order',
                    controller: searchController,
                    color:thememode.isDarkMode ? const Color.fromARGB(221, 46, 45, 45) : const Color.fromRGBO(255, 228, 197, 0.992),
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset('images/Filter_icon.png'),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return OrderCard();
                },
              ),
            ),
            
            ReuseBtn(
              title: 'Check Out',
              ontap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thank your order has been arrived into two days')));
            Navigator.push(context, MaterialPageRoute(builder: (context) => RootScreen()));
              },
              width: double.infinity,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
}
