import 'package:flutter/material.dart';

class UploadedpreviewScreen extends StatefulWidget {
  const UploadedpreviewScreen({super.key});

  @override
  State<UploadedpreviewScreen> createState() => _UploadedpreviewScreenState();
}

class _UploadedpreviewScreenState extends State<UploadedpreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                const SizedBox(height: 20,),
                const Text('Upload your photo profile' , style:TextStyle(fontSize: 35 , fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const SizedBox(
                width: 300,
                child: Text('This data will be displayed in your account profile for security' , style: TextStyle(fontSize: 15),)),
                const SizedBox(height: 140,),
                Center(
                  child:Icon(Icons.image)
                )
                
            ],
          ),
        ),
      ),
    );
  }
}