import 'package:flutter/material.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';

class VoucherPromoScreen extends StatefulWidget {
  const VoucherPromoScreen({super.key});

  @override
  State<VoucherPromoScreen> createState() => _VoucherPromoScreenState();
}

class _VoucherPromoScreenState extends State<VoucherPromoScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const SizedBox(height: 20,),
             const  Text('Voucher Promo' , style: secondryText,),
             const  SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/Frame.png'
                  
                  ))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const SizedBox(
                      width: 152,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          'Special Deal For October' , style: secondrybodyText,),
                      ),
                    ),
                   const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: ReuseBtn(
                        width: 100,
                        height: 45,
                        fontsize: 15,
                        radius: 6,
                        title: 'Order now', ontap: (){} , colors: Colors.white,),
                    )
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