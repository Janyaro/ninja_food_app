import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/View/call_screens/chat_screen.dart';

class UsersScreen extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
   final auth_service = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Call")),
      body: StreamBuilder<QuerySnapshot>(
        stream: auth_service.userCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          final users = snapshot.data!.docs.where(
            (doc) => doc['uid'] != currentUser!.uid, // exclude self
          );

          return ListView(
            children: users.map((doc) {
              return ListTile(
                title: Text(doc['username']),
                subtitle: Text(doc['email']),
                onTap: () {
                  // Navigate to Chat screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        currentUserId: currentUser!.uid,
                        otherUserId: doc['uid'],
                        otherUsername: doc['username'],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
