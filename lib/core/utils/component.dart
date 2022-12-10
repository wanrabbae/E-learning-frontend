import 'dart:js';

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
