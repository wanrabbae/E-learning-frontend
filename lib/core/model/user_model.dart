// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  int? status;
  String? message;
  String? token;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        token: json["token"] == null ? null : json["token"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "token": token == null ? null : token,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.role,
  });

  String? role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
      };
}
