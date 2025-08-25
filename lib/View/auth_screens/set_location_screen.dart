import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 20,),
             const Text('Set your location' , style: pageheadingText,),
             const SizedBox(height: 10,),
         const SizedBox(
            width: 300,
            child: Text('This data will be displayed in your account profile for security')),
           const SizedBox(height: 20,),
            Row(
              children: [
               const Icon(Icons.location_on , color: Colors.yellow, size: 50,),
               const SizedBox(width: 10,),
               const Text('Your Location' , style: secondrybodyText,),
              ],
            ),
            const SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:const Center(child: Text('Set Location' , style: TextStyle(fontSize: 19 , fontWeight: FontWeight.bold ),),),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}