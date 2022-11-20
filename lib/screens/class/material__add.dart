import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MaterialAdd extends StatefulWidget {
  const MaterialAdd({Key? key}) : super(key: key);

  @override
  State<MaterialAdd> createState() => _MaterialAddState();
}

class _MaterialAddState extends State<MaterialAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                      decoration: InputDecoration(
                        hintText: "Judul Materi",
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(PhosphorIcons.textAlignLeftBold),
                        hintText: "Deskripsi Materi",
                        hintStyle: TextStyle(fontSize: 12),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kpink),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(PhosphorIcons.paperclipBold),
                        hintText: "File Terlampir",
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
                      child: SizedBox(
                        width: EdgeInsets.symmetric(horizontal: 60).horizontal,
                        child: TextButton(
                          onPressed: () {
                            goPush(ClassTemplate(), context);
                          },
                          child: Text(
                            "Tambahkan",
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
    );
  }
}
