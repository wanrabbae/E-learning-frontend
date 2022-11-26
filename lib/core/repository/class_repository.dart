import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ClassRepository {
  static Future<ClassModel?> getClass() async {
    var res = await dio.get(
      "$endpoint/class",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return ClassModel.fromJson(res.data);
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
