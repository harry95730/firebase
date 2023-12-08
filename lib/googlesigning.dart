// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_3/accessdb.dart';
import 'package:flutter_application_3/classhandler.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  bool ra = false;
  @override
  void initState() {
    super.initState();
    f();
  }

  f() async {
    await retrieveUsersFromBox();
    await Handler().handleSignInSilently(context);
    setState(() {
      ra = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ra
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Google Sign-In Example'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Handler().handleSignIn(context);
                },
                child: const Text('Sign In with Gooogle'),
              ),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
