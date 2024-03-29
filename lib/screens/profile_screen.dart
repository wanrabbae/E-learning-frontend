import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_learning_app/core/provider/dashboard_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/session_manager.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  bool _isObscure = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick a image : $e");
    }
  }

  Future getPhoto() async {
    try {
      final foto1 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (foto1 == null) return;

      final image1Temporary = File(foto1.path);
      setState(() => this.image = image1Temporary);
    } on PlatformException catch (e) {
      print("Failed to pick a image : $e");
    }
  }

  modalProfil(getImage) => {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Image.file(image!),
            );
          },
        )
      };

  selectImage(getImage) => {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text("Silahkan pilih media untuk upload"),
              content: Container(
                height: tinggi / 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        getImage();
                      },
                      label: Text('Galeri'),
                      icon: Icon(Icons.image),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        getPhoto();
                      },
                      label: Text('Kamera'),
                      icon: Icon(PhosphorIcons.camera),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      };
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: Consumer<DashboardProvider>(builder: (context, dashProv, _) {
        TextEditingController namaController =
            TextEditingController(text: dashProv.data?.nama);
        TextEditingController emailController =
            TextEditingController(text: dashProv.data?.email);
        TextEditingController passwordController = TextEditingController();
        TextEditingController confirmController = TextEditingController();
        return dashProv.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 130),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              shape: BoxShape.circle,
                            ),
                            child: image != null
                                ? Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  )
                                : dashProv.data!.photo != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            dashProv.data!.photo.toString()),
                                      )
                                    : Image.network(
                                        "https://cdn.discordapp.com/attachments/990841636386897971/1028946003744788521/person-4.png",
                                        fit: BoxFit.cover,
                                      ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 65,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: kpink,
                                child: InkWell(
                                  onTap: () {
                                    selectImage(getImage);
                                  },
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50, bottom: 70),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  controller: namaController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    hintText: "Masukkan Nama",
                                    prefixIcon: Icon(
                                      PhosphorIcons.userCircleBold,
                                      size: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                  controller: emailController,
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    hintText: "Masukkan Email",
                                    prefixIcon: Icon(
                                      PhosphorIcons.envelope,
                                      size: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "------------------------- Password Change -------------------------",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20, top: 20),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  controller: passwordController,
                                  obscureText: _isObscure2,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    hintText: "Masukkan Password Baru",
                                    prefixIcon: Icon(
                                      PhosphorIcons.lockBold,
                                      size: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure2 = !_isObscure2;
                                          });
                                        },
                                        icon: Icon(
                                          _isObscure2
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey.shade400,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  obscureText: _isObscure3,
                                  controller: confirmController,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    hintText: "Konfirmasi Password Baru",
                                    prefixIcon: Icon(
                                      PhosphorIcons.lockBold,
                                      size: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure3 = !_isObscure3;
                                          });
                                        },
                                        icon: Icon(
                                          _isObscure3
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey.shade400,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2.0)),
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Consumer<DashboardProvider>(
                                  builder: (context, dashProv2, _) {
                                return Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: SizedBox(
                                    width: EdgeInsets.symmetric(horizontal: 60)
                                        .horizontal,
                                    child: TextButton(
                                      onPressed: () {
                                        var data = {
                                          "image": image,
                                          "nama": namaController.text,
                                          "email": emailController.text,
                                          "password": passwordController.text,
                                          "password_confirmed":
                                              confirmController.text
                                        };
                                        dashProv2.updateProfile(data);
                                      },
                                      child: dashProv2.isLoading
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              "Simpan",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: kpink,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    // SessionManager.clearSession();
                                    showDialog(
                                      context: navigatorKey.currentContext!,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: 200,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Apakah anda yakin ingin log out ?",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kpink)),
                                                        onPressed: () {
                                                          SessionManager
                                                              .clearSession();
                                                        },
                                                        child: Text(
                                                          "Ya",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Tidak",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Keluar",
                                    style: TextStyle(
                                        color: Colors.red.shade600,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red.shade600)),
                                  onPressed: () {
                                    showDialog(
                                      context: navigatorKey.currentContext!,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: 200,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Apakah anda yakin ingin menghapus akun anda ?",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kpink)),
                                                        onPressed: () {
                                                          dashProv
                                                              .deleteProfile();
                                                        },
                                                        child: Text(
                                                          "Ya",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Tidak",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Hapus Akun",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "E-Learning App \n v1.0.0",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade400),
                                textAlign: TextAlign.center,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ));
      }),
    );
  }
}
