import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';
import 'package:lwtecnologia/ui/item_car.dart';

class AccountScreen extends StatefulWidget {
  static String id = 'account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String token = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Auth.user),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton.extended(
        icon: Icon(Icons.place),
        elevation: 0.0,
        label: Text(
          "Adicionar carro",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Roboto Regular', letterSpacing: 1),
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.pushNamed(context, ItemCar.id);
        },
      ),
    );
  }
}
