import 'dart:convert';
import 'dart:io';

import 'package:lwtecnologia/triggers/auth.dart';
import 'package:path_provider/path_provider.dart';

class Cars {
  static File jsonFile;
  static Directory dir;
  static List toList = [];
  static List cars = [];

  static updateCar() {
    cars.clear();
    Cars.toList.forEach((value) {
      if (value['uid'] == Auth.user) {
        cars.add(value);
      }
    });
  }

  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/cars.json");
  }

  static saveData(dataList) async {
    String data = json.encode(dataList);
    print('salvo no json $data');
    final file = await _getFile();
    return file.writeAsStringSync(data);
  }

  static Future<String> readData() async {
    try {
      final file = await _getFile();

      return file.readAsStringSync();
    } catch (e) {
      return null;
    }
  }
}
