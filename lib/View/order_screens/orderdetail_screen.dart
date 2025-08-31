import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class OrderdetailScreen extends StatefulWidget {
  const OrderdetailScreen({super.key});

  @override
  State<OrderdetailScreen> createState() => _OrderdetailScreenState();
}

class _OrderdetailScreenState extends State<OrderdetailScreen> {
  int quantity = 1; // for counter

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
             const  Text('Order Detail', style: pageheadingText),
              const SizedBox(height: 20),
            Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                
                 children: [
                  SlidableAction(onPressed: (context){
                  
                  },
                  backgroundColor: Colors.amber,
                  icon: Icons.delete,
                  foregroundColor: Colors.white,

                  )
                  
                 ],
                 
                 ),
                 
              child:Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'images/rate_image.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                
                    const SizedBox(width: 10),
                
                    // Title, subtitle, price
                   const  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Spacy fresh crab',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'Spacy',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '\$34',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                
                    // Quantity buttons
                    Row(
                      children: [
                 InkWell(
                      onTap: (){},
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(6), // rectangular with small radius
                        ),
                        child:const  Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
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
                      onTap: (){},
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6), // rectangular with small radius
                        ),
                        child:const  Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                      ],
                    ),
                  ],
                ),
              ),
             ),
              // Product Row
              ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            
          height: 210,
          width: double.infinity,
             decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
               image:const  DecorationImage(image: AssetImage('images/Pattern.png'))
             ),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
               child: Column(
                
                  children: [
                    _detailRow(),
                    _detailRow(),
                    _detailRow(),
                    const SizedBox(height: 10,),
                    _detailRow(),
                    const SizedBox(height: 10,),
                    ReuseBtn(
                      colors:Colors.white, 
                      title: 'Place my Order', ontap: (){} , width: double.infinity,)
                    
                  ],
               ),
             ),
           ),
        ),
      ),
    );
  }

static Widget _detailRow(){
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Total bill' , style: TextStyle(fontSize: 18 , color: Colors.white , fontWeight: FontWeight.bold),),
      Text('33\$', style: TextStyle(fontSize: 18 , color: Colors.white , fontWeight: FontWeight.bold)),
    ],
  );
}

}
