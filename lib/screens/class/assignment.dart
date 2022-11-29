import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AssignmentView extends StatefulWidget {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  State<AssignmentView> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends State<AssignmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.arrowArcLeftFill,
            // color: Colors.wh,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kpink,
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 2,
          child: Container(
            height: 100,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama File",
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade500),
                    ),
                    Text(
                      "Tenggat 1 Nov",
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade500),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: SizedBox(
                    width: EdgeInsets.symmetric(horizontal: 60).horizontal,
                    child: TextButton(
                      onPressed: () {
                        goPush(ClassTemplate());
                      },
                      child: Text(
                        "Kumpulkan Tugas",
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
          )),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tenggat 1 November",
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Tugas Integral Tak Tentu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                  """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."""),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "File Lampiran",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
