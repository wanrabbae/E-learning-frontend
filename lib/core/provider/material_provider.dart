import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MaterialProvider extends ChangeNotifier {
  MaterialProvider() {
    init();
  }

  var detailMaterial = {};
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void init() async {
    SessionManager.checkRoleToken();
    await getDetailMaterial();
  }

  Future getDetailMaterial() async {
    _isLoading = true;
    var res = await ClassRepository.detailMaterial(idMateri);
    detailMaterial = {
      "title": res!.title,
      "description": res.description,
      "file": res.file,
      "classId": res.classId,
      "id": res.id
    };

    _isLoading = false;
    notifyListeners();
  }

  Future editMaterial(data) async {
    _isLoading = true;
    var res = await ClassRepository.updateMaterial(data);
    _isLoading = false;
    if (res["status"] == 201) {
      goPush(ClassTemplate());
      SnackBar(
          backgroundColor: kpink, content: Text("Berhasil mengubah materi"));
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }
}
