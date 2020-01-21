import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final String uid;
  final String token;
  final bool on;
  final List<dynamic> cars;

  Auth({this.uid, this.token, this.on, this.cars});

  Future<void> write(uid, token, on, cars) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
    prefs.setString('token', token);
    prefs.setBool('on', on);
    prefs.setStringList(uid, cars);
  }

  static Future<Auth> read() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uid = '';
      var token = '';
      var on = false;
      List<dynamic> cars = [];
      if (prefs != null) {
        uid = prefs.getString('uid');
        token = prefs.getString('token');
        on = prefs.getBool('on');
        cars = prefs.getStringList(uid);
      }

      print('$uid e $token e $on e $cars');
      return new Auth.fromData(uid, token, on, cars);
    } catch (e) {
      return e;
    }
  }

  factory Auth.fromData(uid, token, on, cars) {
    return Auth(
      uid: uid,
      token: token,
      on: on,
      cars: cars,
    );
  }
}
