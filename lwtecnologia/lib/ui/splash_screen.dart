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
  TextStyle style = new TextStyle(fontFamily: 'Roboto Regular', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new FutureBuilder<Auth>(
        future: Auth.read(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(" teste ${snapshot.data.on}");
            if (snapshot.data.on) {
              Navigator.pushReplacementNamed(context, MainPages.id);
            } else {
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: new CircularProgressIndicator());
          } else {
            return new Center(
              child: new LoginScreen(),
            );
          }
          return Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
