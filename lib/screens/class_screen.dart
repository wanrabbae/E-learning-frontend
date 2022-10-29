import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Class Screen"),
      ),
    );
  }
}
