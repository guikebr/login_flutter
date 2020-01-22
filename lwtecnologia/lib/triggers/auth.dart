import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Auth {
  static File jsonFile;
  static Directory dir;
  static List toList = [];
  static String user;

  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/logger.json");
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

  static deleteData() async {
    final file = await _getFile();

    return file.deleteSync(recursive: true);
  }

  static authentication(bool login) {
    List items = [];
    for (var user in Auth.toList) {
      if (user['uid'] == Auth.user) {
        user['isLoged'] = login;
      }
      items.add(user);
    }

    Auth.deleteData();

    for (var user in items) {
      if (user['uid'] == Auth.user) {
        Auth.user = user['uid'];
        print(user);
      }
    }

    Auth.saveData(items).then((_) {
      print('salvo');
    }).catchError((error) {
      print(error);
    });
  }
}
