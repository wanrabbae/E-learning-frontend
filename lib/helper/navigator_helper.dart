import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future goPush(Widget widget, context) async =>
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
