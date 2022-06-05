import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_org/controller/user_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class Api {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchEvents() async {
    var eventsSnap = await _db
        .collection('Organizations')
        .doc(UserController.loggedInUser.value.uid)
        .collection('Events')
        .get();
    return eventsSnap.docs;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> fetchUser(
      String uid) async {
    var userSnap = await _db.collection('Organizations').doc(uid).get();
    return userSnap;
  }

  static Future<String> uploadImageToFirebase(
      File image, String folderName) async {
    String finalURL = '';
    String fileName = path.basename(image.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('$folderName/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(image.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    finalURL = await taskSnapshot.ref.getDownloadURL();
    return finalURL;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchTickets() {
    var ticketSnap = _db
        .collection('Issues')
        .where('orgUid', isEqualTo: UserController.loggedInUser.value.uid)
        .snapshots();
    return ticketSnap;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchServices() {
    var serviceSnap = _db
        .collection('Organizations')
        .doc(UserController.loggedInUser.value.uid)
        .collection('Services')
        .snapshots();
    return serviceSnap;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchHousekeeping() {
    var serviceSnap = _db
        .collection('Organizations')
        .doc(UserController.loggedInUser.value.uid)
        .collection('Housekeeping')
        .snapshots();
    return serviceSnap;
  }
}
