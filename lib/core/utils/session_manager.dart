import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static Future<SharedPreferences> pref = SharedPreferences.getInstance();

  static Future checkSession() async {}

  static Future setSession(token) async {
    var session = await pref;
    session.setString(
      "token",
      token.toString(),
    );
  }

  static Future clearSession() async {
    var session = await pref;
    session.clear();
  }
}
