import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/user_model.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static Future<UserModel?> getProfile() async {
    var res = await dio.get(
      "$endpoint/profile",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return UserModel.fromJson(res.data);
    }
  }
}
