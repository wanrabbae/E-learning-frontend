import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:flutter/foundation.dart';

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
}
