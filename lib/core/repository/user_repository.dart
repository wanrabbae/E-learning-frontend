import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/user_model.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static Future<UserModel?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    var res = await dio.get(
      "$endpoint/profile",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return UserModel.fromJson(res.data);
    } else if (res.statusCode == 500) {
      SessionManager.clearSession();
      goRemove(WelcomeScreen());
    }
  }

  static Future deleteProfile() async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    var res = await dio.delete(
      "$endpoint/profile/delete",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());
    print(res.data);
    if (res.statusCode == 200) {
      return res.data;
    }
  }
}
