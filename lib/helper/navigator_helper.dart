import 'package:e_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

Future goPush(Widget widget) async {
  return await Navigator.push(navigatorKey.currentState!.context,
      MaterialPageRoute(builder: (_) => widget));
}

Future goReplacement(Widget widget) async {
  return await Navigator.pushReplacement(navigatorKey.currentState!.context,
      MaterialPageRoute(builder: (context) => widget));
}

Future goRemove(Widget widget) async {
  return await Navigator.pushAndRemoveUntil(navigatorKey.currentState!.context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Future goBack({dynamic argument}) async {
  return Navigator.pop(navigatorKey.currentState!.context, argument);
}
