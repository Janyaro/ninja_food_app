import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/Services/data_services.dart';
import 'package:food_app/View/order_screens/edit_location_screen.dart';
import 'package:food_app/View/order_screens/edit_payment_screen.dart';
import 'package:food_app/View/order_screens/your_order_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:provider/provider.dart';

class ConfirmOrderScreen extends StatefulWidget {
  final double subTotal;
  final double discount;
  final double delivery;
  final double total;

  const ConfirmOrderScreen({
    super.key,
    required this.subTotal,
    required this.discount,
    required this.delivery,
    required this.total,
  });

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  final dataservice = DataServices();
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('Confirm Order', style: pageheadingText),
              const SizedBox(height: 20),

              // Deliver To Section
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Deliver To',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditLocationScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(13),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: Image.asset(
                              'images/Show.png',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: FutureBuilder<String>(
                              future: uid != null
                                  ? dataservice.getUserLocation(uid!)
                                  : Future.value("No user"),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.hasError) {
                                  return const Text(
                                    "Error loading location",
                                    style: TextStyle(color: Colors.red),
                                  );
                                }
                                if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Text("No location found");
                                }
                                return Text(
                                  snapshot.data!,
                                  style: secondrybodyText,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              // Payment Method Section
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditPaymentScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(13),
                            child: Image.asset(
                              'images/Paypal.png',
                              color: thememode.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '****39495',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Bottom summary and Place Order button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('images/Pattern.png'),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  _detailRow(
                      'Subtotal', '\$${widget.subTotal.toStringAsFixed(2)}'),
                  _detailRow(
                      'Delivery Charge', '\$${widget.delivery.toStringAsFixed(2)}'),
                  _detailRow(
                      'Discount', '\$${widget.discount.toStringAsFixed(2)}'),
                  const SizedBox(height: 10),
                  _detailRow('Total Amount', '\$${widget.total.toStringAsFixed(2)}'),
                  Flexible(
                    child: ReuseBtn(
                      colors: Colors.white,
                      title: 'Place my Order',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YourOrderScreen(),
                          ),
                        );
                      },
                      width: double.infinity,
                      height: 60,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _detailRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
