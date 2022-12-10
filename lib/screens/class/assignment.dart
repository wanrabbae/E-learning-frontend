import 'package:e_learning_app/core/provider/assignment_provider.dart';
import 'package:e_learning_app/core/utils/component.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AssignmentView extends StatefulWidget {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  State<AssignmentView> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends State<AssignmentView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AssignmentProvider(),
      child: Consumer<AssignmentProvider>(builder: (context, assignProv, _) {
        return assignProv.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: customAppBar1(namaKelas.toString(), context),
                bottomNavigationBar: BottomAppBar(
                    elevation: 2,
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama File",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade500),
                              ),
                              Text(
                                "Tenggat 1 Nov",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child: SizedBox(
                              width: EdgeInsets.symmetric(horizontal: 60)
                                  .horizontal,
                              child: TextButton(
                                onPressed: () {
                                  goPush(ClassTemplate());
                                },
                                child: Text(
                                  "Kumpulkan Tugas",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: kpink,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                body: SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tenggat 1 November",
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        assignProv.assignments["title"] ?? "",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                        child: Text(
                            """${assignProv.assignments["description"] ?? ''}"""),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "File Lampiran",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () async {
                            final Uri _url =
                                Uri.parse(assignProv.assignments["file"]);
                            if (!await launchUrl(
                              _url,
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: Text("Buka File Lampiran"))
                    ],
                  ),
                )),
              );
      }),
    );
  }
}
