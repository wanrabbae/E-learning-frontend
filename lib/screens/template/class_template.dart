import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_learning_app/core/utils/custom_component.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/assignment_add.dart';
import 'package:e_learning_app/screens/class/class_home.dart';
import 'package:e_learning_app/screens/class/class_work.dart';
import 'package:e_learning_app/screens/class/material__add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ClassTemplate extends StatefulWidget {
  const ClassTemplate({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassTemplate> createState() => _ClassTemplateState();
}

class _ClassTemplateState extends State<ClassTemplate> {
  var isDark = false;
  List<Widget> listWidget = [
    ClassHome(),
    ClassWork(),
  ];
  int selectedIndex = 0;
  void val(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _showDialog() {
    // flutter defined function
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          // title: new Text("Alert Dialog title"),
          // content: new Text("Alert Dialog body"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  goPush(AssignmentAdd());
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        PhosphorIcons.clipboardText,
                        size: 20,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Tugas Baru",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  goPush(MaterialAdd());
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        PhosphorIcons.bookBookmark,
                        size: 20,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Materi Baru",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme:
          ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
      home: Scaffold(
        floatingActionButton: role!.toLowerCase() == "guru"
            ? FloatingActionButton(
                onPressed: () {
                  _showDialog();
                },
                backgroundColor: kpink,
                child: Icon(Icons.add),
              )
            : Text(""),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            val(index);
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(PhosphorIcons.graduationCapFill),
                title: Text('Beranda Kelas'),
                activeColor: kpink,
                inactiveColor: Colors.grey[300]),
            BottomNavyBarItem(
              icon: Icon(PhosphorIcons.penFill),
              title: Text('Tugas'),
              inactiveColor: Colors.grey[300],
              activeColor: kpink,
            ),
          ],
        ),
        appBar: customAppBar1(namaKelas.toString(), context),
        body: listWidget.elementAt(selectedIndex),
      ),
    );
  }
}
