import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static void signin() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    List<String> userSigninMehthods = await _firebaseAuth
        .fetchSignInMethodsForEmail(googleSignInAccount!.email);
    if (userSigninMehthods.isEmpty) {
      Fluttertoast.showToast(
        msg: "User Does Not Exists",
        backgroundColor: Colors.red.shade900,
        textColor: Colors.white,
      ).then((value) {
        _googleSignIn.signOut();
        return;
      });
    } else {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    }
  }

  static void signOut() {
    _googleSignIn.signOut();
    _firebaseAuth.signOut();
  }
}
