import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/user_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/repository/user_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/login_screen.dart';
import 'package:e_learning_app/screens/template/main_template.dart';
import 'package:e_learning_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    init();
  }

  Data? data;
  List<Datum>? kelas;
  String? quote;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void init() async {
    await getProfile();
    await getQuotes();
  }

  Future getProfile() async {
    _isLoading = true;
    var res = await UserRepository.getProfile();

    data = res!.data;

    _isLoading = false;
    notifyListeners();
  }

  Future deleteProfile() async {
    _isLoading = true;
    var res = await UserRepository.deleteProfile();
    _isLoading = false;
    if (res["status"] == 200) {
      SessionManager.clearSession();
      goRemove(WelcomeScreen());
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future updateProfile(data) async {
    _isLoading = true;
    var res = await UserRepository.updateProfile(data);
    _isLoading = false;
    if (res["status"] == 200) {
      goPush(MainTemplate());
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future getQuotes() async {
    try {
      GoogleTranslator translator = GoogleTranslator();
      var response = await dio.get(quotesEndpoint);
      if (response.statusCode == 200) {
        var translated = await translator.translate(response.data[0]["q"],
            from: "en", to: "id");
        quote = translated.toString();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getClass() async {
    _isLoading = true;
    var res = await ClassRepository.getClass();

    kelas = res!.data ?? [];

    _isLoading = false;
    notifyListeners();
  }
}
