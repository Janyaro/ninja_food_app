import 'package:flutter/material.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/Services/data_services.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String verificationId;
  const EmailVerificationScreen({super.key, required this.verificationId});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final authService = AuthService();
  String otpCode = "";
  bool isLoading = false;

  void verifyOtp() async {
    if (otpCode.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter complete OTP")),
      );
      return;
    }
    setState(() {
      isLoading = true;
      authService.smsCode = otpCode; // Set smsCode to AuthService for verification
    });

    await authService.verifyOtp(context, widget.verificationId);

    setState(() {
      isLoading = false;
    });
  }
final user = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Enter 4 digit verification code",
              style: pageheadingText,
            ),
            const SizedBox(height: 10),
            FutureBuilder(future: DataServices().getUserNumber(user.auth.currentUser!.uid), builder: (context , snapshot){
              return  SizedBox(
              width: 280,
              child: Text(
                textAlign: TextAlign.start,
                'Code sent to +6282045****. This code will expire in 01:30',
              ),
            ); 
            }),
            
            const SizedBox(height: 20),

            PinCodeTextField(
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                otpCode = value;
              },
            ),

            const SizedBox(height: 20),
            const Spacer(),

            Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : ReuseBtn(
                      title: 'Verify',
                      ontap: verifyOtp,
                    ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
