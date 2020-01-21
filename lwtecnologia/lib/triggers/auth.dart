import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Auth {
  final String uid;
  final String token;

  Auth({this.uid, this.token});

  Future<File> write(String jwt) async {
    final directory = await getTemporaryDirectory();
    final path = directory.path;
    final file = File('$path/auth.txt');
    return file.writeAsString('$jwt');
  }

  Future<String> read() async {
    try {
      //in a file or using
      final directory = await getTemporaryDirectory();
      final path = directory.path;
      final file = File('$path/auth.txt');
      String contents = await file.readAsString();
      print(contents);
      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<Auth> fetchGet(uid) async {
    final response = await get("https://www.google.com");
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Auth.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load get');
    }
  }

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      uid: json['uid'],
      token: json['token'],
    );
  }
}
