import 'package:e_learning_app/core/provider/detailClass_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({Key? key}) : super(key: key);

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  final Uri _url = Uri.parse(endpointAsset + "/" + detailMateri?["file"]);

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_url';
    }
    // launchUrl(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailMateri?["title"] ?? "",
              // materialData.detailMateri
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(detailMateri?["description"] ?? ""),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "File Lampiran",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: _launchUrl, child: Text("Buka File Lampiran"))
          ],
        ),
      )),
    );
  }
}
