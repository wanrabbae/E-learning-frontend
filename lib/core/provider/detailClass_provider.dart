import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';

import 'package:flutter/material.dart';

class DetailClassProvider extends ChangeNotifier {
  DetailClassProvider() {
    init();
  }
  var kelas;
  var banner;
  var classId;
  var detailMateri;
  List<Datum>? listClass;
  List<Materials>? listMateri;
  List<Assignment>? listAssigment;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void init() async {
    SessionManager.checkRoleToken();
    await getDetailClass(idClass);
  }

  Future getDetailClass(id) async {
    _isLoading = true;
    var res = await ClassRepository.getDetailClass(id);
    print(res);
    kelas = res!.data!.title;
    banner = res.data!.banner;
    classId = res.data!.id;
    listAssigment = res.data!.assignments ?? [];
    listMateri = res.data!.materials ?? [];

    _isLoading = false;
    notifyListeners();
  }

  Future deleteMaterial(id) async {
    _isLoading = true;
    var res = await ClassRepository.deleteMaterial(id);
    _isLoading = false;
    print(res);
    if (res["status"] == 200) {
      goPush(ClassTemplate());
      SnackBar(
          backgroundColor: kpink, content: Text("Berhasil menghapus materi"));
    } else if (res["status"] == 500) {
      print(res);
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future addMaterial(data) async {
    _isLoading = true;
    var res = await ClassRepository.addMaterial(data);
    _isLoading = false;
    if (res["status"] == 201) {
      goPush(ClassTemplate());
      SnackBar(
          backgroundColor: kpink, content: Text("Berhasil menambahkan kelas"));
    } else if (res["status"] == 500) {
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }

  Future detailMaterial() async {
    _isLoading = true;
    print("ID MATERI: " + idMateri.toString());
    var res = await ClassRepository.detailMaterial(idMateri);
    _isLoading = false;
    if (res["status"] == 200) {
      detailMateri = res["data"];
      notifyListeners();
    } else if (res["status"] == 500) {
      print(res);
      SnackBar(backgroundColor: Colors.red, content: Text("Error 400"));
    }
  }
}
