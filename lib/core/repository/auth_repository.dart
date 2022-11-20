import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  static Future register(Map<String, dynamic> requestBody) async {
    var res = await dio.post(
      "$endpoint/register",
      data: jsonEncode(requestBody),
    );

    log(res.realUri.toString());

    if (res.statusCode == 201) {
      return res.data;
    } else if (res.statusCode == 400) {
      return res.data;
    }
  }

  static Future login(Map<String, dynamic> requestBody) async {
    var res = await dio.post(
      "$endpoint/login",
      data: jsonEncode(requestBody),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return res.data;
    } else if (res.statusCode == 400) {
      return res.data;
    }
  }
}
