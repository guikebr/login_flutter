import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';
import 'package:lwtecnologia/ui/main_pages.dart';
import 'package:lwtecnologia/utils/input_text.dart';
import 'package:lwtecnologia/utils/login_button.dart';
import 'package:lwtecnologia/utils/show_snack_bar.dart';

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

  bool save = true;

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
                  child: save
                      ? new LoginButton(
                          style: style,
                          function: () {
                            save = false;
                            Map<String, dynamic> newList = Map();
                            newList["uid"] = _controllerEmail.text;
                            newList["password"] = _controllerPassword.text;
                            newList["isLoged"] = true;

                            if (_controllerEmail.text.isEmpty ||
                                _controllerPassword.text.isEmpty) {
                              ShowSnackBar(_scaffoldKey)
                                  .showInSnackBar('Preencha os campos');
                            } else {
                              if (Auth.toList.isNotEmpty) {
                                for (var user in Auth.toList) {
                                  print(user);
                                  if (user['uid'] == _controllerEmail.text &&
                                      user['password'] ==
                                          _controllerPassword.text) {
                                    Auth.user = _controllerEmail.text;
                                    Auth.authentication(true);
                                    print('entrou');
                                    Navigator.pushReplacementNamed(
                                        context, MainPages.id);
                                  } else if (user['uid'] ==
                                          _controllerEmail.text &&
                                      user['password'] !=
                                          _controllerPassword.text) {
                                    ShowSnackBar(_scaffoldKey).showInSnackBar(
                                        'Autenticação inválida');
                                  } else {
                                    print('teste');
                                    Auth.toList.add(newList);
                                    Auth.user = _controllerEmail.text;

                                    Auth.saveData(Auth.toList).then((_) {
                                      Navigator.pushReplacementNamed(
                                          context, MainPages.id);
                                    }).catchError((error) {
                                      save = true;
                                      print(error);
                                    });
                                    break;
                                  }
                                }
                              } else {
                                print('novo usuario');

                                Auth.user = _controllerEmail.text;
                                Auth.toList.add(newList);

                                Auth.saveData(Auth.toList).then((_) {
                                  Navigator.pushReplacementNamed(
                                      context, MainPages.id);
                                }).catchError((error) {
                                  save = true;
                                  print(error);
                                });
                              }
                            }
                          })
                      : new CircularProgressIndicator(),
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
