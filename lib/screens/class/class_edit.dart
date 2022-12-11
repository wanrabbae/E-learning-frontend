import 'dart:io';

import 'package:e_learning_app/core/provider/class_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class ClassEdit extends StatefulWidget {
  const ClassEdit({Key? key}) : super(key: key);

  @override
  State<ClassEdit> createState() => _ClassEditState();
}

class _ClassEditState extends State<ClassEdit> {
  File? image;

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
                    FlatButton.icon(
                      onPressed: () {
                        getImage();
                      },
                      label: Text('Galeri'),
                      icon: Icon(Icons.image),
                    ),
                    FlatButton.icon(
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

  var nama;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClassProvider(),
      child: Consumer<ClassProvider>(builder: (context, classProv, _) {
        return classProv.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.only(top: 30),
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                PhosphorIcons.xBold,
                                size: 25,
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      nama = val;
                                    });
                                  },
                                  initialValue: classData["title"] ?? nama,
                                  decoration: InputDecoration(
                                    hintText: "Nama Kelas",
                                    hintStyle: TextStyle(fontSize: 20),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: kpink),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  onTap: () {
                                    selectImage(getImage);
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(PhosphorIcons.paperclipBold),
                                    hintText: "Banner Kelas",
                                    hintStyle: TextStyle(fontSize: 12),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: kpink),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  child: image != null
                                      ? Image.file(
                                          image!,
                                          fit: BoxFit.cover,
                                        )
                                      : workData["banner"] != null
                                          ? Image.network(
                                              workData["banner"],
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "https://picsum.photos/500/300",
                                              fit: BoxFit.cover,
                                            ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: EdgeInsets.symmetric(horizontal: 60)
                                        .horizontal,
                                    child: TextButton(
                                      onPressed: () {
                                        var data = {
                                          "image": image,
                                          "nama": nama,
                                          "id": idKelas,
                                        };
                                        print(data);
                                        classProv.editClass(data);
                                      },
                                      child: Text(
                                        "Edit Kelas",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: kpink,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              );
      }),
    );
  }
}
