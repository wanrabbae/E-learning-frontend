// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

ClassModel classModelFromJson(String str) =>
    ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  ClassModel({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.banner,
    this.title,
    this.teacherId,
    this.user,
  });

  int? id;
  String? banner;
  String? title;
  int? teacherId;
  User? user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        banner: json["banner"] == null ? null : json["banner"],
        title: json["title"] == null ? null : json["title"],
        teacherId: json["teacher_id"] == null ? null : json["teacher_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "banner": banner == null ? null : banner,
        "title": title == null ? null : title,
        "teacher_id": teacherId == null ? null : teacherId,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.nama,
    this.email,
    this.role,
  });

  int? id;
  String? nama;
  String? email;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "email": email == null ? null : email,
        "role": role == null ? null : role,
      };
}
