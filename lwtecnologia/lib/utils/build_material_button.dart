import 'package:flutter/material.dart';

class BuildMaterialButton extends StatelessWidget {
  const BuildMaterialButton({
    Key key,
    @required this.style,
    @required this.function,
  }) : super(key: key);

  final TextStyle style;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: function,
        child: Text(
          "Cadastrar",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
