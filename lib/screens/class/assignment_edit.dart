import 'package:e_learning_app/core/provider/assignment_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AssignmentEdit extends StatefulWidget {
  const AssignmentEdit({Key? key}) : super(key: key);

  @override
  State<AssignmentEdit> createState() => _AssignmentEditState();
}

class _AssignmentEditState extends State<AssignmentEdit> {
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
        child: Consumer<AssignmentProvider>(
          builder: (context, assignProv, child) {
            TextEditingController titleController =
                TextEditingController(text: assignProv.assignments["title"]);
            TextEditingController descController = TextEditingController(
                text: assignProv.assignments["description"]);
            TextEditingController deadlineController = TextEditingController(
                text: assignProv.assignments["expired"].toString());
            return assignProv.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Scaffold(
                    body: Container(
                        margin: EdgeInsets.only(top: 30),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  PhosphorIcons.xBold,
                                  size: 25,
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      hintText: "Judul Tugas",
                                      hintStyle: TextStyle(fontSize: 20),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: kpink),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: descController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(PhosphorIcons.textAlignLeftBold),
                                      hintText: "Deskripsi Tugas",
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: kpink),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    onTap: () {
                                      getFile();
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(PhosphorIcons.paperclipBold),
                                      hintText: "File Terlampir",
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: kpink),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: deadlineController,
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          onChanged: (date) {
                                        print('change $date');

                                        // DatePicker.showTimePicker(context,
                                        //     showTitleActions: true, onChanged: (date) {
                                        //   print('change $date in time zone ' +
                                        //       date.timeZoneOffset.inHours.toString());
                                        // }, onConfirm: (date) {
                                        //   print('confirm $date');
                                        // }, currentTime: DateTime.now());
                                      }, onConfirm: (date) {
                                        print('confirm $date');
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.id);
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(PhosphorIcons.timerBold),
                                      hintText: "Tenggat Waktu",
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: kpink),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: double.infinity,
                                    child: SizedBox(
                                      width:
                                          EdgeInsets.symmetric(horizontal: 60)
                                              .horizontal,
                                      child: TextButton(
                                        onPressed: () {
                                          var data = {
                                            "title": titleController.text,
                                            "description": descController.text,
                                            "file": fileName,
                                            "deadline": deadlineController.text,
                                            "id": idTugas
                                          };

                                          assignProv.editAssignment(data);
                                        },
                                        child: Text(
                                          "Simpan Perubahan",
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
                            )
                          ],
                        )),
                  );
          },
        ));
  }
}
