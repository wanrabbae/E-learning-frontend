import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/user_model.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';
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
    }
  }
}
