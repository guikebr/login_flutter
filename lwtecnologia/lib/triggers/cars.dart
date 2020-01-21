import 'package:http/http.dart';
import 'dart:convert';

class Car {
  final String placa;

  Car({this.placa});

  Future<List<Car>> fetchGetUser(uid) async {
    final response = await get("https://");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List<dynamic> property = json.decode(response.body);

      var item = new List<Car>();

      for (var json in property) {
        item.add(Car.fromJson(json));
      }

      return item;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load get');
    }
  }

  factory Car.fromJson(Map<String, dynamic> json) {
    return new Car(
      placa: json['placa'],
    );
  }
}
