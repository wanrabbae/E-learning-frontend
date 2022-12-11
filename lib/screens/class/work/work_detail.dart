import 'package:e_learning_app/core/provider/work_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/utils/custom_component.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkDetail extends StatefulWidget {
  const WorkDetail({Key? key}) : super(key: key);

  @override
  State<WorkDetail> createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkProvider(),
      child: Consumer<WorkProvider>(builder: ((context, workProv, child) {
        return Scaffold(
            appBar: customAppBar1(namaKelas.toString(), context),
            body: SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(workData["user"].photo),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    workData["user"].nama.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Diserahkan",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "File Terlampir: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () async {
                          final Uri _url = Uri.parse(workData["file"]);
                          if (!await launchUrl(
                            _url,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw 'Could not launch $_url';
                          }
                        },
                        child: Text("Buka File Lampiran"))
                  ]),
            )),
            bottomNavigationBar: BottomAppBar(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    var data = {"id": workData["id"], "status": "rejected"};
                    print(data);
                    workProv.updateStatus(data);
                  },
                  child: Text(
                    "Kembalikan Tugas",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.red.shade500,
                  ),
                ),
              ),
            ));
      })),
    );
  }
}
