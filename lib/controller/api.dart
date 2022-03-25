import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchEvents() async {
    var eventsSnap = await _db
        .collection('Organizations')
        .doc('OU7N0lCaWVxbYssLmM19')
        .collection('Events')
        .get();
    eventsSnap.docs;
    return eventsSnap.docs;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> fetchUser(
      String uid) async {
    var userSnap = await _db.collection('Users').doc(uid).get();
    return userSnap;
  }
}
