// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/accessdb.dart';
import 'package:flutter_application_3/classhandler.dart';

class LoginScreen extends StatefulWidget {
  final User? harry;
  const LoginScreen({super.key, required this.harry});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void dialoguebox() async {
    var res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Switch Accounts',
                        style: TextStyle(
                            fontSize: 30, decoration: TextDecoration.none),
                      ),
                    ),
                    Material(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lis.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(lis[index].displayname),
                            subtitle: Text(lis[index].email),
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                              lis[index].photourl,
                            )),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text(' + ADD NEW ACCOUNT'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
    if (res != null) {
      await Handler().handleSignIn(context);
    } else {
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text('Google'),
        actions: [
          if (widget.harry != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => dialoguebox(),
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                  widget.harry!.photoURL!,
                )),
              ),
            )
        ],
      ),
    );
  }
}
