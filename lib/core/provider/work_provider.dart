import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:flutter/foundation.dart';

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
}
