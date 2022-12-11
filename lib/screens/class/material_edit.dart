import 'package:e_learning_app/core/provider/material_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class MaterialEdit extends StatefulWidget {
  const MaterialEdit({Key? key}) : super(key: key);

  @override
  State<MaterialEdit> createState() => _MaterialEditState();
}

class _MaterialEditState extends State<MaterialEdit> {
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
        create: (_) => MaterialProvider(),
        child: Consumer<MaterialProvider>(
          builder: (context, materialProv, child) {
            TextEditingController titleController = TextEditingController(
                text: materialProv.detailMaterial["title"]);
            TextEditingController descController = TextEditingController(
                text: materialProv.detailMaterial["description"]);

            return materialProv.isLoading == true
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
                                      hintText: "Judul Materi",
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
                                      hintText: "Deskripsi Materi",
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
                                  Container(
                                    width: double.infinity,
                                    child: SizedBox(
                                      width:
                                          EdgeInsets.symmetric(horizontal: 60)
                                              .horizontal,
                                      child: TextButton(
                                        onPressed: () {
                                          var data = {
                                            "file": fileName,
                                            "title": titleController.text,
                                            "description": descController.text,
                                            "id": materialProv
                                                .detailMaterial["id"]
                                          };
                                          print(data);
                                          materialProv.editMaterial(data);
                                          // goPush(ClassTemplate());
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
