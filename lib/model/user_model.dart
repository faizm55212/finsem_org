import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUser {
  final String name;
  final String bio;
  final String email;
  final String uid;
  final String add;

  FirebaseUser({
    required this.name,
    required this.email,
    required this.add,
    required this.bio,
    required this.uid,
  });

  factory FirebaseUser.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> user) {
    return FirebaseUser(
      name: user.data()!['name'],
      email: user.data()!['email'],
      add: user.data()!['address'],
      bio: user.data()!['bio'],
      uid: user.id,
    );
  }
}
