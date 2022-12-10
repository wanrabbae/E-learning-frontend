// To parse this JSON data, do
//
//     final detailclassModel = detailclassModelFromJson(jsonString);

import 'dart:convert';

DetailclassModel detailclassModelFromJson(String str) =>
    DetailclassModel.fromJson(json.decode(str));

String detailclassModelToJson(DetailclassModel data) =>
    json.encode(data.toJson());

class DetailclassModel {
  DetailclassModel({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory DetailclassModel.fromJson(Map<String, dynamic> json) =>
      DetailclassModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.banner,
    this.title,
    this.teacherId,
    this.user,
    this.materials,
    this.assignments,
  });

  int? id;
  String? banner;
  String? title;
  int? teacherId;
  User? user;
  List<Materials>? materials;
  List<Assignment>? assignments;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        banner: json["banner"] == null ? null : json["banner"],
        title: json["title"] == null ? null : json["title"],
        teacherId: json["teacher_id"] == null ? null : json["teacher_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        materials: json["materials"] == null
            ? null
            : List<Materials>.from(
                json["materials"].map((x) => Materials.fromJson(x))),
        assignments: json["assignments"] == null
            ? null
            : List<Assignment>.from(
                json["assignments"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "banner": banner == null ? null : banner,
        "title": title == null ? null : title,
        "teacher_id": teacherId == null ? null : teacherId,
        "user": user == null ? null : user!.toJson(),
        "materials": materials == null
            ? null
            : List<dynamic>.from(materials!.map((x) => x.toJson())),
        "assignments": assignments == null
            ? null
            : List<dynamic>.from(assignments!.map((x) => x.toJson())),
      };
}

class Materials {
  Materials({
    this.id,
    this.classId,
    this.title,
    this.description,
    this.file,
  });

  int? id;
  int? classId;
  String? title;
  String? description;
  String? file;

  factory Materials.fromJson(Map<String, dynamic> json) => Materials(
        id: json["id"] == null ? null : json["id"],
        classId: json["class_id"] == null ? null : json["class_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        file: json["file"] == null ? null : json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "class_id": classId == null ? null : classId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "file": file == null ? null : file,
      };
}

class Assignment {
  Assignment({
    this.id,
    this.classId,
    this.title,
    this.description,
    this.expired,
    this.file,
  });

  int? id;
  int? classId;
  String? title;
  String? description;
  DateTime? expired;
  String? file;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"] == null ? null : json["id"],
        classId: json["class_id"] == null ? null : json["class_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        expired:
            json["expired"] == null ? null : DateTime.parse(json["expired"]),
        file: json["file"] == null ? null : json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "class_id": classId == null ? null : classId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "expired": expired == null ? null : expired!.toIso8601String(),
        "file": file == null ? null : file,
      };
}

class WorksModel {
  WorksModel({
    this.status,
    this.data,
  });

  int? status;
  List<Works>? data;

  factory WorksModel.fromJson(Map<String, dynamic> json) => WorksModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Works>.from(json["data"].map((x) => Works.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Works {
  Works({
    this.id,
    this.assignment_id,
    this.user_id,
    this.file,
    this.status,
    this.user,
  });

  int? id;
  int? assignment_id;
  int? user_id;
  String? file;
  String? status;
  User? user;

  factory Works.fromJson(Map<String, dynamic> json) => Works(
        id: json["id"] == null ? null : json["id"],
        assignment_id:
            json["assignment_id"] == null ? null : json["assignment_id"],
        user_id: json["user_id"] == null ? null : json["user_id"],
        file: json["file"] == null ? null : json["file"],
        status: json["status"] == null ? null : json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "assignment_id": assignment_id == null ? null : assignment_id,
        "user_id": user_id == null ? null : user_id,
        "file": file == null ? null : file,
        "status": status == null ? null : status,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.photo,
    this.nama,
    this.email,
    this.role,
  });

  int? id;
  dynamic? photo;
  String? nama;
  String? email;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        photo: json["photo"],
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "photo": photo,
        "nama": nama == null ? null : nama,
        "email": email == null ? null : email,
        "role": role == null ? null : role,
      };
}
