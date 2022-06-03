// ignore_for_file: prefer_final_fields

import 'package:finsem_org/controller/api.dart';
import 'package:finsem_org/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static Rx<FirebaseUser> _loggedInUser = FirebaseUser(
    name: '',
    add: '',
    email: '',
    bio: '',
    uid: '',
  ).obs;
  static Rx<FirebaseUser> get loggedInUser => _loggedInUser;

  Future<void> init() async {
    var user = await Api.fetchUser(FirebaseAuth.instance.currentUser!.uid);
    _loggedInUser.value = FirebaseUser.fromFirebase(user);
  }
}
