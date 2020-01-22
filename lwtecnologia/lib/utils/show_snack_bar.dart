import 'package:flutter/material.dart';

class ShowSnackBar {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  ShowSnackBar(this.scaffoldKey);

  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: TextStyle(
            fontFamily: 'Roboto Regular',
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
