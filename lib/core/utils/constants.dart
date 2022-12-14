import 'package:dio/dio.dart';
import 'package:e_learning_app/core/model/user_model.dart';
import 'package:flutter/material.dart';

// const kpink = Color.fromARGB(255, 65, 243, 80);
const kpink = Color(0xFF3beb1c);
const kblue = Color(0xFF71b8ff);
const kpurple = Color(0xFF9ba0fc);
const korange = Color(0xFFffaa5b);
const quotesEndpoint = "https://zenquotes.io/api/random";
const endpoint = "https://elearning.afkaaruna.sch.id/api";
const endpointAsset = "https://elearning.afkaaruna.sch.id/assets";

Dio dio = Dio();

String? token;
String? namaKelas;

String? role;
int? idClass;
int? idMateri;
int? idTugas;
int? idKelas;
String? className;
String? classBanner;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

double lebar = MediaQuery.of(navigatorKey.currentContext!).size.width;

double tinggi = MediaQuery.of(navigatorKey.currentContext!).size.height;

const kElevation = 1.0;
const kTiny = 2.0;
const kSmall = 4.0;
const kMedium = 8.0;
const kLarge = 16.0;
var workData = {};
var classData = {};
