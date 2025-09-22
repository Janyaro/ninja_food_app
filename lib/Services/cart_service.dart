import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/Models/menu_item.dart';

class CartService {

final cart = FirebaseFirestore.instance.collection('CartItems');

Future<void> addCartItem(MenuItem item)async{
  final date = DateTime.now().millisecondsSinceEpoch.toString();
   await cart.doc(date).set(item.toJson());
}

}