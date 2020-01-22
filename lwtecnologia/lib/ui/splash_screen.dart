import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';
import 'package:lwtecnologia/ui/login_screen.dart';
import 'package:lwtecnologia/ui/main_pages.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _State createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Auth.readData().then((results) {
      if (results != null) {
        final users = json.decode(results);

        for (var user in users) {
          print(user);
          Auth.toList.add(user);
          if (user['isLoged']) {
            Auth.user = user['uid'];
            Navigator.pushReplacementNamed(context, MainPages.id);
          } else {
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          }
        }
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
