import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key key,
    @required this.style,
    @required this.controller,
    @required this.hint,
    @required this.obscure,
  }) : super(key: key);

  final TextStyle style;
  final String hint;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: hint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}
