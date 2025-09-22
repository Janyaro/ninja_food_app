import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/View/call_screens/chat_screen.dart';

class UsersScreen extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    body: currentUser == null  ? Center(child: Text('No User Login')) :  StreamBuilder<QuerySnapshot>(
        stream: authService.userCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!.docs.where(
            (doc) => doc['uid'] != currentUser!.uid,
          );

          if (users.isEmpty) {
            return const Center(child: Text("No other users available"));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: users.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    leading:CircleAvatar(child: Image.asset(data['avatarUrl'] ?? 'Unknown')),
                    title: Text(data['name'] ?? 'Unknown'),
                    subtitle: Text(data['email'] ?? ''),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            currentUserId: currentUser!.uid,
                            otherUserId: data['uid'],
                            otherUsername: data['name'] ?? 'Unknown',
                            imageUrl: data['avatarUrl'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
