// import 'dart:convert';
import 'package:e_learning_app/core/model/user_model.dart';
import 'package:e_learning_app/core/repository/auth_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/custom_component.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/login_screen.dart';
import 'package:e_learning_app/screens/template/main_template.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future register(Map<String, dynamic> requestBody) async {
    isLoading = true;
    var res = await AuthRepository.register(requestBody);
    isLoading = false;
    if (res["status"] == 201) {
      CustomSnackBar(res["message"]);
      goBack();
    } else if (res["status"] == 400) {
      CustomSnackBar(res["message"], false);
    }
  }

  Future login(Map<String, dynamic> requestBody) async {
    isLoading = true;
    var res = await AuthRepository.login(requestBody);
    isLoading = false;
    print(res["status"]);
    if (res["status"] == 200) {
      SessionManager.setToken(res["token"]);
      SessionManager.setRole(res["data"]["role"]);
      goRemove(MainTemplate());
      CustomSnackBar(res["message"]);
    } else if (res["status"] == 400) {
      CustomSnackBar(res["message"], false);
    }
  }

  Future forgotPassword(Map<String, dynamic> requestBody) async {
    isLoading = true;
    var res = await AuthRepository.login(requestBody);
    isLoading = false;

    if (res["status"] == 200) {
      goRemove(MainTemplate());
    } else {
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(res["message"]),
      );
    }
  }
}
