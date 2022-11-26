import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';

import 'package:flutter/material.dart';

class DetailClassProvider extends ChangeNotifier {
  DetailClassProvider() {
    init();
  }
  var kelas;
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
    await getDetailClass(idClass);
  }

  Future getDetailClass(id) async {
    _isLoading = true;
    var res = await ClassRepository.getDetailClass(id);
    print(res);
    kelas = res!.data!.title;
    listAssigment = res.data!.assignments ?? [];
    listMateri = res.data!.materials ?? [];

    _isLoading = false;
    notifyListeners();
  }
}
