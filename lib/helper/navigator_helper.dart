import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future goPush(Widget widget, context) async =>
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));

Future goRemove(Widget widget, context) async => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: ((context) => widget)),
    ((route) => false));
