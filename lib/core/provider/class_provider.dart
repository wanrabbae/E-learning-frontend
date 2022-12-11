import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/custom_component.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/main_template.dart';

import 'package:flutter/material.dart';

class ClassProvider extends ChangeNotifier {
  ClassProvider() {
    init();
  }

  List<Datum>? listClass;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void init() async {
    SessionManager.checkRoleToken();
    await getClass();
  }

  Future getClass() async {
    _isLoading = true;
    var res = await ClassRepository.getClass();

    listClass = res!.data ?? [];

    _isLoading = false;
    notifyListeners();
  }

  Future addClass(data) async {
    _isLoading = true;
    var res = await ClassRepository.addClass(data);
    _isLoading = false;
    if (res["status"] == 201) {
      goRemove(MainTemplate());
      infoSnackBar("Berhasil Menambahkan Kelas");
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future deleteClass(id) async {
    _isLoading = true;
    var res = await ClassRepository.deleteClass(id);
    _isLoading = false;
    if (res["status"] == 200) {
      goPush(MainTemplate());
      infoSnackBar("Berhasil Menghapus Kelas");
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }
}
