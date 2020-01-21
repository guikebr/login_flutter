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
  TextStyle style = new TextStyle(fontFamily: 'Roboto Light', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerEmail = new TextEditingController();
    TextEditingController _controllerPassword = new TextEditingController();

    return Scaffold(
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
                      "${_controllerEmail.text} and ${_controllerPassword.text}",
                    ),
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
