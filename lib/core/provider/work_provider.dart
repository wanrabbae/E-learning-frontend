import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WorkProvider extends ChangeNotifier {
  WorkProvider() {
    init();
  }

  List<Works>? listWorks;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void init() async {
    SessionManager.checkRoleToken();
    await getListWork();
  }

  Future getListWork() async {
    _isLoading = true;
    var res = await ClassRepository.getListWork(idTugas);
    listWorks = res!.data ?? [];
    _isLoading = false;
    notifyListeners();
  }

  Future updateStatus(data) async {
    _isLoading = true;
    var res = await ClassRepository.updateStatusWork(data);
    _isLoading = false;
    if (res["status"] == 201) {
      goBack();
      SnackBar(
          backgroundColor: kpink,
          content: Text("Berhasil mengembalikan tugas"));
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }
}
