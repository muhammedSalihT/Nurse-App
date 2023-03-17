import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // static String get baseurl => "https://dcc.gitdr.com/";
  static String user = "";
  static String get phone => user;
  static getPhone() async {
    final login = await SharedPreferences.getInstance();
    user = login.getString("phone") ?? "";
    log(user);
  }

  static setPhone(String mob) async {
    final login = await SharedPreferences.getInstance();
    login.setString("phone", mob);
    getPhone();
    log(user);
  }

  static clearData() async {
    final prefs = await SharedPreferences.getInstance();
    var r = await prefs.clear();
    log(r.toString());
  }
}
