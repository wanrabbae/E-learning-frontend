import 'package:e_learning_app/core/repository/class_repository.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:flutter/foundation.dart';

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
}
