import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';

class EditLocationScreen extends StatefulWidget {
  const EditLocationScreen({super.key});

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Shipping' , style: pageheadingText,),
            const SizedBox(height: 20,),
             Card(
              child: Container(
                padding:const EdgeInsets.all(6),
                height: 120,
                decoration:const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text('Order Location' , style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          padding:const  EdgeInsets.all(8),
                          decoration:const  BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle
                          
                          ),
                          child:const Icon(Icons.location_on_rounded , color: Colors.white,)),
                          const SizedBox(width: 15,),
                    const Expanded(child: Text('8502 Preston Rd. Inglewood, Maine 98380' , style: secondrybodyText,))
                      ],
                    ),
                  ],
                ),

              ),
            ),
             Card(
              child: Container(
                padding:const EdgeInsets.all(12),
                
                decoration:const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text('Deliever To' , style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:const  EdgeInsets.all(8),
                          decoration:const  BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle
                          
                          ),
                          child:const Icon(Icons.location_on_rounded , color: Colors.white,)),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                        const Text('8502 Preston Rd. Inglewood, Maine 98380' , style: secondrybodyText,  maxLines: 2, // prevent overflow
                                  overflow: TextOverflow.ellipsis, ),
                                                TextButton(onPressed: (){}, child: Text('Set Location' , style: TextStyle(color: Colors.green),))
                              ],
                            ),
                          )
                      ],
                    ),
                  ],
                ),

              ),
            )
           ],
        ),
      ),
    );
  }
  
}