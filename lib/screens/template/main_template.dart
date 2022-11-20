import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/class_add.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/screens/home_screen.dart';
import 'package:e_learning_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainTemplate extends StatefulWidget {
  const MainTemplate({Key? key}) : super(key: key);

  @override
  State<MainTemplate> createState() => _MainTemplateState();
}

class _MainTemplateState extends State<MainTemplate> {
  var isDark = false;
  List<Widget> listWidget = [
    HomeScreen(),
    ProfileScreen(),
  ];
  int selectedIndex = 0;
  void val(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme:
          ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
      home: Scaffold(
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
                icon: Icon(Icons.home),
                title: Text('Beranda'),
                activeColor: kpink,
                inactiveColor: Colors.grey[300]),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              inactiveColor: Colors.grey[300],
              activeColor: kpink,
            ),
          ],
        ),
        body: listWidget.elementAt(selectedIndex),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            goPush(ClassAdd());
          },
          backgroundColor: kpink,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
