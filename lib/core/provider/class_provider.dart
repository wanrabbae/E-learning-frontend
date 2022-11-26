import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';

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
    await getClass();
  }

  Future getClass() async {
    _isLoading = true;
    var res = await ClassRepository.getClass();

    listClass = res!.data ?? [];

    _isLoading = false;
    notifyListeners();
  }
}
