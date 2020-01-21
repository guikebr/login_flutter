import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';

class AccountScreen extends StatefulWidget {
  static String id = 'account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String token = '';

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<Auth>(
      future: Auth.read(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(
              "Token de usuário ${snapshot.data.token}",
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao carregar o perfil ${snapshot.hashCode}"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
