// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    this.photo,
    this.nama,
    this.email,
    this.role,
  });

  int? id;
  String? photo;
  String? nama;
  String? email;
  String? role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        photo: json["photo"] == null ? null : json["photo"],
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "photo": photo == null ? null : photo,
        "nama": nama == null ? null : nama,
        "email": email == null ? null : email,
        "role": role == null ? null : role,
      };
}
