import 'package:e_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

AppBar customAppBar1(title, context) => AppBar(
      title: Text(namaKelas.toString()),
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
    );

void infoSnackBar(String message,
    {bool showTextButton = false,
    String titleButton = "restart",
    Function? onPressedText,
    Duration? duration}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.blue,
      content: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: kLarge),
          Expanded(child: Text(message)),
          Visibility(
            visible: showTextButton,
            child: TextButton(
                onPressed: onPressedText == null ? null : onPressedText(),
                child: Text("$titleButton",
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    ),
  );
}

void errorSnackBar(dynamic error) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white),
          SizedBox(width: kLarge),
          Expanded(
              child: Text(error.toString(),
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    ),
  );
}

Future alertDialog(msg, context) {
  return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Success",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    msg,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  )
                ],
              )),
        );
      });
}

CustomSnackBar(
  String? text, [
  isSuccess = true,
]) =>
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? Colors.lightGreen : Colors.red,
        content: isSuccess ? Text(text ?? '') : Text(text ?? ''),
      ),
    );
