import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_app/View/order_screens/confirm_order_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class OrderdetailScreen extends StatefulWidget {
  const OrderdetailScreen({super.key});

  @override
  State<OrderdetailScreen> createState() => _OrderdetailScreenState();
}

class _OrderdetailScreenState extends State<OrderdetailScreen> {
  double discount = 20;
  double delivery_charge = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('CartItems').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Scaffold(
              body: Center(child: Text("No items in cart")),
            );
          }

          final cartDocs = snapshot.data!.docs;

          // 🔹 Calculate totalAmount
          double subAmount = 0;
          for (var doc in cartDocs) {
            final data = doc.data() as Map<String, dynamic>;
            final price = (data['price'] ?? 0).toDouble();
            final quantity = (data['quantity'] ?? 1) as int;
            subAmount += price * quantity;
          }
          double totalAmount = subAmount + delivery_charge + discount; // ✅ discount should be subtracted

          return Scaffold(
            
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text('Order Detail', style: pageheadingText),
                  const SizedBox(height: 20),

                  // 🔹 Show Cart Items
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartDocs.length,
                      itemBuilder: (context, index) {
                        final data =
                            cartDocs[index].data() as Map<String, dynamic>;

                        final price = (data['price'] ?? 0).toDouble();
                        final quantity = (data['quantity'] ?? 1) as int;

                        return Slidable(
                          key: ValueKey(cartDocs[index].id), // ✅ fixed missing key
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  await FirebaseFirestore.instance
                                      .collection('CartItems')
                                      .doc(cartDocs[index].id)
                                      .delete();
                                  print('Deleted cart item');
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                foregroundColor: Colors.white,
                              )
                            ],
                          ),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      data['imageUrl'] ?? '',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder: (ctx, _, __) =>
                                          const Icon(Icons.fastfood, size: 40),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'] ?? 'Unknown',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          maxLines: 1,
                                          data['desc'] ?? '',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                        Text(
                                          "\$${(price * quantity).toStringAsFixed(2)}", // ✅ fixed price*quantity
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (quantity > 1) {
                                            FirebaseFirestore.instance
                                                .collection('CartItems')
                                                .doc(cartDocs[index].id)
                                                .update({
                                              'quantity': quantity - 1
                                            }); // ✅ update Firestore instead of local state
                                          }
                                        },
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: Colors.green[200],
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Icon(Icons.remove,
                                              color: Colors.white, size: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '$quantity',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection('CartItems')
                                              .doc(cartDocs[index].id)
                                              .update({
                                            'quantity': quantity + 1
                                          }); // ✅ update Firestore instead of local state
                                        },
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Icon(Icons.add,
                                              color: Colors.white, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Bottom Order Summary
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
                          'Sub-Total', '\$${subAmount.toStringAsFixed(2)}'),
                      _detailRow('Delivery charge', '\$10'),
                      _detailRow('Discount', '\$20'),
                      const SizedBox(height: 4),
                      _detailRow(
                          'Total Amount', '\$${totalAmount.toStringAsFixed(2)}'),
                      const SizedBox(height: 10),
                      Flexible(
                        child: ReuseBtn(
                          colors: Colors.white,
                          title: 'Place my Order',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmOrderScreen(subTotal: subAmount, discount: discount, delivery: delivery_charge, total: totalAmount, ),
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
          );
        },
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
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(amount,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
