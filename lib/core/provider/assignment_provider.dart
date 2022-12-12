import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AssignmentProvider extends ChangeNotifier {
  AssignmentProvider() {
    init();
  }

  var assignments = {};
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void init() async {
    SessionManager.checkRoleToken();
    await getDetailAssignment();
  }

  Future getDetailAssignment() async {
    _isLoading = true;
    var res = await ClassRepository.getDetailAssignment(idTugas);
    assignments = {
      "title": res!.title,
      "description": res.description,
      "file": res.file,
      "classId": res.classId,
      "expired": res.expired,
      "id": res.id
    };
    // assignments = res;

    _isLoading = false;
    notifyListeners();
  }

  Future editAssignment(data) async {
    _isLoading = true;
    var res = await ClassRepository.updateAssignment(data);
    _isLoading = false;
    if (res["status"] == 201) {
      goPush(ClassTemplate());
      SnackBar(
          backgroundColor: kpink, content: Text("Berhasil mengubah tugas"));
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future addWork(data) async {
    _isLoading = true;
    var res = await ClassRepository.addWork(data);
    _isLoading = false;
    if (res["status"] == 201) {
      goBack();
      SnackBar(
          backgroundColor: kpink, content: Text("Berhasil mengumpulkan tugas"));
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }
}
