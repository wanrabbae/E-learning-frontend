import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/main_template.dart';
import 'package:e_learning_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_learning_app/core/utils/constants.dart';

class SessionManager {
  static Future<SharedPreferences> pref = SharedPreferences.getInstance();

  static Future checkSession() async {
    var session = await pref;
    var _token = session.getString("token");
    var _role = session.getString("role");
    if (_token != null && _role != null) {
      role = _role;
      token = _token;
      print("Token = $token");
      print("Role = $role");
      goRemove(MainTemplate());
    }
  }

  static Future setToken(String token) async {
    var session = await pref;
    session.setString(
      "token",
      token,
    );
    var _token = session.getString("token");
    token = _token!;
  }

  static Future setRole(String role) async {
    var session = await pref;
    session.setString(
      "role",
      role,
    );
    var _role = session.getString("role");
    role = _role!;
  }

  static Future clearSession() async {
    var session = await pref;
    session.clear();
    goRemove(WelcomeScreen());
  }
}
