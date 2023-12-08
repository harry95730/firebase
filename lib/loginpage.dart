// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/accessdb.dart';
import 'package:flutter_application_3/classhandler.dart';
import 'package:flutter_application_3/userclass.dart';

class LoginScreen extends StatefulWidget {
  Usr harry;
  LoginScreen({super.key, required this.harry});

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
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text(widget.harry.displayname),
                        subtitle: Text(widget.harry.email),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                          widget.harry.photourl,
                        )),
                      ),
                    ),
                    Material(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lis.length,
                        itemBuilder: (context, index) {
                          if (widget.harry != lis[index]) {
                            return ListTile(
                              onTap: () {
                                widget.harry = lis[index];
                                Navigator.pop(context);
                              },
                              title: Text(lis[index].displayname),
                              subtitle: Text(lis[index].email),
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                lis[index].photourl,
                              )),
                            );
                          }
                          return Container();
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
      setState(() {});
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => dialoguebox(),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                widget.harry.photourl,
              )),
            ),
          )
        ],
      ),
    );
  }
}
