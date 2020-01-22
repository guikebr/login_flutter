import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';
import 'package:lwtecnologia/triggers/cars.dart';
import 'package:lwtecnologia/utils/build_material_button.dart';

class ItemCar extends StatefulWidget {
  static String id = "item_car";

  @override
  _ItemCarState createState() => _ItemCarState();
}

class _ItemCarState extends State<ItemCar> {
  TextStyle style = new TextStyle(fontFamily: 'Roboto Light', fontSize: 20.0);

  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerPlate = new TextEditingController();
  TextEditingController _controllerYear = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Cadastro',
          style: TextStyle(
            fontFamily: 'Roboto Regular',
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTextField(
                _controllerName, 'Nome do carro', TextInputType.text),
            buildTextField(
                _controllerPlate, 'Placa do carro', TextInputType.text),
            buildTextField(
                _controllerYear, 'Ano do carro', TextInputType.number),
          ],
        ),
      ),
      bottomSheet: Visibility(
        visible: _controllerYear.text.isNotEmpty &&
            _controllerPlate.text.isNotEmpty &&
            _controllerName.text.isNotEmpty,
        child: BuildMaterialButton(
          style: style,
          function: () {
            Map<String, dynamic> newList = Map();
            newList["uid"] = Auth.user;
            newList["type"] = _controllerName.text;
            newList["plate"] = _controllerPlate.text;
            newList["year"] = _controllerYear.text;
            Cars.toList.add(newList);

            Cars.saveData(Cars.toList).then((_) {
              Cars.updateCar();
              Navigator.pop(context);
            }).catchError((error) {
              print(error);
            });
          },
        ),
      ),
    );
  }

  Widget buildTextField(controller, text, input) {
    return new TextField(
      controller: controller,
      keyboardType: input,
      textInputAction: TextInputAction.done,
      maxLines: null,
      maxLength: 350,
      style: new TextStyle(
        fontFamily: 'Roboto Regular',
        letterSpacing: 1,
      ),
      decoration: new InputDecoration(
        hintText: 'Digite aqui',
        labelText: text,
        hintStyle: new TextStyle(
          fontFamily: 'Roboto Light',
          letterSpacing: 1,
        ),
        labelStyle: new TextStyle(
          fontFamily: 'Roboto Regular',
          letterSpacing: 1,
        ),
      ),
      onChanged: (value) {
        setState(() {
          //updateScreen
        });
      },
    );
  }
}
