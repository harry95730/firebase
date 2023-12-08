// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/accessdb.dart';
import 'package:flutter_application_3/loginpage.dart';
import 'package:flutter_application_3/userclass.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Handler {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> handleSignIn(BuildContext context) async {
    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          Usr harr = Usr(
              photourl: user.photoURL!,
              name: user.uid,
              email: user.email!,
              displayname: user.displayName!);
          await addUsersToBox(harr);
          await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(harry: harr)));
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> handleSignInSilently(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser =
          await googleSignIn.signInSilently();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          Usr harr = Usr(
              photourl: user.photoURL!,
              name: user.uid,
              email: user.email!,
              displayname: user.displayName!);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(harry: harr)));
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }
}
