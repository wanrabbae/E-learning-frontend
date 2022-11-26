import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassRepository {
  static Future<ClassModel?> getClass() async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/class",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return ClassModel.fromJson(res.data);
    } else if (res.statusCode == 500) {
      SessionManager.clearSession();
      goRemove(WelcomeScreen());
    }
  }

  static Future<DetailclassModel?> getDetailClass(id) async {
    var res = await dio.get(
      "$endpoint/class?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return DetailclassModel.fromJson(res.data);
    }
  }
}
