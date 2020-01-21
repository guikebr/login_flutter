import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';
import 'package:lwtecnologia/utils/input_text.dart';
import 'package:lwtecnologia/utils/login_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextStyle style = new TextStyle(fontFamily: 'Roboto Light', fontSize: 20.0);

  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 45.0),
                Flexible(
                  flex: 2,
                  child: new InputText(
                    style: style,
                    hint: 'Email',
                    controller: _controllerEmail,
                    obscure: false,
                  ),
                ),
                SizedBox(height: 25.0),
                Flexible(
                  flex: 2,
                  child: new InputText(
                    style: style,
                    hint: 'Senha',
                    controller: _controllerPassword,
                    obscure: true,
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Flexible(
                  flex: 3,
                  child: new LoginButton(
                    style: style,
                    function: () => Auth().write(
                      _controllerEmail.text,
                      _controllerPassword.text,
                      true,
                      [],
                    ).catchError((e) => print(e)),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
