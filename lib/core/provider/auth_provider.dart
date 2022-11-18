import 'package:e_learning_app/core/model/user_model.dart';
import 'package:e_learning_app/core/repository/auth_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
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
      goBack();
      SnackBar(backgroundColor: Colors.green, content: Text(res["message"]));
    } else if (res["status" == 400]) {
      SnackBar(backgroundColor: Colors.red, content: Text(res["message"]));
    }
  }

  Future login(Map<String, dynamic> requestBody) async {
    isLoading = true;
    var res = await AuthRepository.login(requestBody);
    isLoading = false;
    if (res["status"] == 200) {
      SessionManager.setSession(res["token"]);
      goRemove(MainTemplate());
    } else if (res["status"] == 400) {
      SnackBar(backgroundColor: Colors.red, content: Text(res["message"]));
    }
  }
}
