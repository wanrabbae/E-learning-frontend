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
