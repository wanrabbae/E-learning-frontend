import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/constants.dart';

class CostumeAppBar extends StatefulWidget {
  const CostumeAppBar({Key? key}) : super(key: key);

  @override
  State<CostumeAppBar> createState() => _CostumeAppBarState();
}

class _CostumeAppBarState extends State<CostumeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dashboard_rounded,
              color: kblue,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ))
      ],
    );
  }
}
