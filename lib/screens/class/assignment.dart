import 'package:e_learning_app/core/provider/assignment_provider.dart';
import 'package:e_learning_app/core/utils/component.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:file_picker/file_picker.dart';
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
  var fileName;
  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'xlsx',
          'pptx',
          'ppt',
          'jpg',
          'png',
          'jpeg'
        ]);

    if (result != null) {
      PlatformFile file = result.files.first;
      print(result.files.first);
      setState(() {
        fileName = file;
      });
    } else {
      // User canceled the picker
      print("CANCEL UPLOAD FILE");
      setState(() {
        fileName = null;
      });
    }
  }

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
                      height: 150,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: new Container(
                                  child: new Text(
                                    fileName?.name ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ),
                              Text(
                                "Tenggat " +
                                    assignProv.assignments["expired"]
                                        .toString()
                                        .split(" ")[0],
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
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: SizedBox(
                              width: EdgeInsets.symmetric(horizontal: 60)
                                  .horizontal,
                              child: TextButton(
                                onPressed: () {
                                  getFile();
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                    PhosphorIcons.plus,
                                    size: 15,
                                    color: Colors.black,
                                  )),
                                  TextSpan(
                                    text: "Tambahkan File Lampiran",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  )
                                ])),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: SizedBox(
                              width: EdgeInsets.symmetric(horizontal: 60)
                                  .horizontal,
                              child: TextButton(
                                onPressed: () {
                                  var data = {
                                    "file": fileName,
                                  };
                                  assignProv.addWork(data);
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
                        "Tenggat " +
                            assignProv.assignments["expired"]
                                .toString()
                                .split(" ")[0],
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
