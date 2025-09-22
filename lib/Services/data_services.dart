import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  final users = FirebaseFirestore.instance.collection("users");

  Future<String> getUserLocation(String uid) async {
    try {
      final doc = await users.doc(uid).get();
      if (doc.exists && doc.data()!.containsKey("location")) {
        return doc["location"];
      } else {
        return "No location set";
      }
    } catch (e) {
      return "Error fetching location: $e";
    }
  }

    Future<String> getUserNumber(String uid) async {
    try {
      final doc = await users.doc(uid).get();
      if (doc.exists && doc.data()!.containsKey("number")) {
        return doc["number"];
      } else {
        return "No location set";
      }
    } catch (e) {
      return "Error fetching location: $e";
    }
  }

  Future<void> updateUserLocation(String uid, String location) async {
    try {
      await users.doc(uid).update({"location": location});
    } catch (e) {
      print("Error updating location: $e");
    }
  }
}
