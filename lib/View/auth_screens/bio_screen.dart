import 'package:flutter/material.dart';
import 'package:food_app/Provider/payment_provider.dart';
import 'package:food_app/View/auth_screens/paymentmethod_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class BioScreen extends StatefulWidget {
  final String username , email , password;
  const BioScreen({super.key , required this.username , required this.email , required this.password});

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal:10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h,),
               const Text('Fill in your bio to get start' , style: pageheadingText,),
                SizedBox(height: 10.h,),
               const Text('This data will be displayed in your account profile for security',style: TextStyle(fontSize: 14 , color: Colors.grey),),
                SizedBox(height: 20.h,),
                ReuseTextform(title: 'First Name', controller: firstnameController), 
               SizedBox(height: 15.h,),
              ReuseTextform(title: 'Last Name', controller: lastnameController), 
               SizedBox(height: 15.h,),
              ReuseTextform(title: 'Phone Number', controller: phoneController), 
              SizedBox(height: 25.h,),
              ReuseBtn(
              title: 'Next',
              ontap: () {
                final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
            
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
            value: paymentProvider,
            child: PaymentmethodScreen(
              username: widget.username,
              email: widget.email,
              password: widget.password,
              firstname: firstnameController.text,
              lastname: lastnameController.text,
              phoneNumber: phoneController.text,
            ),
                    ),
                  ),
                );
              },
            ),
              SizedBox(height: 20.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}