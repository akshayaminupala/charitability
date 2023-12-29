import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/screens/mycards.dart';
import 'package:flash_chat/components/screens/welcomescreen.dart';
import 'package:flutter/material.dart';

class InitalScreen extends StatefulWidget {
  @override
  _InitalScreenState createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, mycards.id);
      }
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
