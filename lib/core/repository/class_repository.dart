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
    }
  }

  static Future<DetailclassModel?> getDetailClass(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/class?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return DetailclassModel.fromJson(res.data);
    }
  }

  static Future addClass(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    String fileName = data["image"].path.split("/").last;

    FormData formData = FormData.fromMap({
      "banner":
          await MultipartFile.fromFile(data["image"].path, filename: fileName),
      "title": data["nama"],
    });

    var res = await dio.post(
      "$endpoint/class",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());

    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future deleteClass(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.delete(
      "$endpoint/class?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return res.data;
    }
  }
}
