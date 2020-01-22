import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Cars {
  static File jsonFile;
  static Directory dir;
  static List toList = [];

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
