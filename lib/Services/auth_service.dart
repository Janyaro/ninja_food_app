import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Models/user_model.dart';
import 'package:food_app/View/Home/home_screen.dart';
import 'package:food_app/View/auth_screens/emailverfication_screen.dart';
import 'package:food_app/View/auth_screens/password_screen.dart';
import 'package:food_app/View/auth_screens/signup_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection("users");
  String smsCode = "";
  // log out user from the app 
  Future<void> logout (BuildContext context)async{
   await auth.signOut().then((val)=>{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()))
   });
  }

  // login user function
  Future<void> LoginUser(String email , String password , BuildContext context)async{
    final credientail  = await auth.signInWithEmailAndPassword(email: email, password: password);
    if(credientail.user != null){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please login with authenticate crediential')));   
  }

  // signup user 
  Future<void> saveUserData(UserModel usermodel) async {
  try {
    // Create Firebase user
    UserCredential cred = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: usermodel.email!, password: usermodel.password!);

    String uid = cred.user!.uid;

    // Save user info in Firestore
    await userCollection.doc(uid).set({
      "uid": uid,
      "name": usermodel.name,
      "email": usermodel.email,
      "firstName": usermodel.firstName,
      "lastName": usermodel.lastName,
      "phone": usermodel.phone,
      "paymentMethod": usermodel.paymentMethod,
      "avatarUrl": usermodel.avatarUrl,
      "createdAt": FieldValue.serverTimestamp(),
    });

    // Save address in sub-collection
    if (usermodel.address != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("addresses")
          .add({
        "address": usermodel.address,
        "createdAt": FieldValue.serverTimestamp(),
      });
    }
  } catch (e) {
    print("Error saving user: $e");
  }
}

Future<void> sendOtpToPhone(String phoneNumber) async {
  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      print("Verification failed: ${e.message}");
    },
    codeSent: (String verificationId, int? resendToken) {
      // Save verificationId in state or pass to OTP screen
      print("Code sent, verificationId: $verificationId");
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print("Timeout: $verificationId");
    },
  );
}
Future<void> sendEmailReset(BuildContext context ,String email , ) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent to $email")),
      );
    } catch (e) {
      print("Email reset error: $e");
    }
  }

  Future<void> sendPhoneOtp(BuildContext context , String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print("Phone verification failed: $e");
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailVerificationScreen(
              verificationId: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }



  Future<void> verifyOtp( BuildContext context,String verificationId ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PasswordScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP: $e")),
      );
    }
  }
// Google Sign-In with Firestore user saving
Future<User?> signInWithGoogle(BuildContext context) async {
  try {
    // Start Google Sign-In
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null; // user cancelled

    // Get auth details
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create Firebase credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = userCredential.user;

    if (user != null) {
      // Check if user exists in Firestore
      DocumentSnapshot userDoc =
          await userCollection.doc(user.uid).get();

      if (!userDoc.exists) {
        // Save new user in Firestore
        await userCollection.doc(user.uid).set({
          "uid": user.uid,
          "name": user.displayName ?? "",
          "email": user.email ?? "",
          "avatarUrl": user.photoURL ?? "",
          "phone": user.phoneNumber ?? "",
          "createdAt": FieldValue.serverTimestamp(),
        });
      }
    }

    return user; // Firebase user object
  } catch (e) {
    print("Google Sign-In failed: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Google Sign-In failed")),
    );
    return null;
  }
}

}