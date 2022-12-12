import 'dart:convert';
import 'dart:developer';

import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/detailClass_model.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassRepository {
  static Future<ClassModel?> getClass() async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/class",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return ClassModel.fromJson(res.data);
    }
  }

  static Future<DetailclassModel?> getDetailClass(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/class?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return DetailclassModel.fromJson(res.data);
    }
  }

  static Future addClass(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    String fileName = data["image"] != null
        ? data["image"].path.split("/").last
        : "https://picsum.photos/500/300";

    FormData formData = FormData.fromMap({
      "banner": data["image"] != null
          ? await MultipartFile.fromFile(data["image"].path, filename: fileName)
          : "https://picsum.photos/500/300",
      "title": data["nama"],
    });

    var res = await dio.post(
      "$endpoint/class",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());

    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future updateClass(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    String fileName =
        data["image"] != null ? data["image"].path.split("/").last : "null";

    FormData formData = FormData.fromMap({
      "banner": data["image"] != null
          ? await MultipartFile.fromFile(data["image"].path, filename: fileName)
          : null,
      "title": data["nama"],
      "id": data["id"],
    });

    var res = await dio.put(
      "$endpoint/class",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future deleteClass(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.delete(
      "$endpoint/class?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return res.data;
    }
  }

  static Future addMaterial(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(data["file"].path,
          filename: data["file"].name),
      "title": data["title"],
      "description": data["description"],
      "classId": data["classId"],
    });

    var res = await dio.post(
      "$endpoint/materials",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future updateMaterial(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    FormData formData = FormData.fromMap({
      "file": data["file"] != null
          ? await MultipartFile.fromFile(data["file"].path,
              filename: data["file"].name)
          : null,
      "title": data["title"],
      "description": data["description"],
      "id": data["id"],
    });

    var res = await dio.put(
      "$endpoint/materials",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future deleteMaterial(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.delete(
      "$endpoint/materials?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
        validateStatus: (status) => true,
      ),
    );

    log(res.realUri.toString());

    print(res.data);

    if (res.statusCode == 200) {
      return res.data;
    }
  }

  static Future<Materials?> detailMaterial(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/materials?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
        validateStatus: (status) => true,
      ),
    );
    log(res.realUri.toString());
    if (res.statusCode == 200) {
      return Materials.fromJson(res.data["data"]);
    }
  }

  static Future<Assignment?> getDetailAssignment(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/assignments?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());
    if (res.statusCode == 200) {
      return Assignment.fromJson(res.data["data"]);
    }
  }

  static Future addAssignment(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(data["file"].path,
          filename: data["file"].name),
      "title": data["title"],
      "description": data["description"],
      "expired": data["deadline"].toString().split(" ")[0],
      "classId": data["classId"],
    });

    var res = await dio.post(
      "$endpoint/assignments",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    print(res.data);
    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future updateAssignment(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    print(data["file"]);
    FormData formData = FormData.fromMap({
      "file": data["file"] != null
          ? await MultipartFile.fromFile(data["file"].path,
              filename: data["file"].name)
          : null,
      "title": data["title"],
      "description": data["description"],
      "expired": data["deadline"].toString().split(" ")[0],
      "id": data["id"],
    });

    var res = await dio.put(
      "$endpoint/assignments",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future deleteAssignment(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.delete(
      "$endpoint/assignments?id=$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
        validateStatus: (status) => true,
      ),
    );

    log(res.realUri.toString());

    print(res.data);

    if (res.statusCode == 200) {
      return res.data;
    }
  }

  static Future<WorksModel?> getListWork(assignment_id) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");
    var res = await dio.get(
      "$endpoint/works?id=$assignment_id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token2",
        },
      ),
    );

    log(res.realUri.toString());
    if (res.statusCode == 200) {
      return WorksModel.fromJson(res.data);
    }
  }

  static Future addWork(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(data["file"].path,
          filename: data["file"].name),
      "assignmentId": idTugas,
    });

    var res = await dio.post(
      "$endpoint/works",
      data: formData,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    print(res.data);
    if (res.statusCode == 201) {
      return res.data;
    }
  }

  static Future updateStatusWork(data) async {
    final prefs = await SharedPreferences.getInstance();
    var token2 = prefs.getString("token");

    var res = await dio.put(
      "$endpoint/work-status",
      data: data,
      options: Options(headers: {
        "Authorization": "Bearer $token2",
      }),
    );

    log(res.realUri.toString());
    print(res.data);
    if (res.statusCode == 201) {
      return res.data;
    }
  }
}
