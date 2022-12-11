import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/product_model.dart';
import 'package:e_learning_app/core/provider/class_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/class_edit.dart';
import 'package:e_learning_app/screens/template/class_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ClassProvider(),
        child: Consumer<ClassProvider>(
          builder: (context, classProv, _) {
            return classProv.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: classProv.listClass!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 1.6),
                    itemBuilder: (context, index) {
                      var i = classProv.listClass![index];
                      return ClassCard(
                        product: i,
                      );
                    });
          },
        ));
  }
}

class ClassCard extends StatelessWidget {
  const ClassCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Datum product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          idClass = product.id;
          namaKelas = product.title;
          goPush(ClassTemplate());
        },
        child: Container(
          // padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: product.banner != null
                      ? product.banner.toString().contains("null")
                          ? NetworkImage("https://picsum.photos/500/300")
                          : NetworkImage(product.banner.toString())
                      : NetworkImage("https://picsum.photos/500/300")),
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Padding(padding: EdgeInsets.only(top: 5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text(
                      "Guru: ${product.user!.nama}",
                      style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                role!.toLowerCase() == "guru"
                    ? Consumer<ClassProvider>(builder: (context, classProv, _) {
                        return PopupMenuButton(
                            icon: Icon(Icons.more_vert,
                                color: Colors.white), // add this line
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                                  PopupMenuItem<String>(
                                      child: Container(
                                          width: 100,
                                          // height: 30,
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: Colors.red[400]),
                                          )),
                                      value: 'delete'),
                                  PopupMenuItem<String>(
                                      child: Container(
                                          width: 100,
                                          // height: 30,
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: Colors.blue[400]),
                                          )),
                                      value: 'update'),
                                ],
                            onSelected: (index) async {
                              switch (index) {
                                case 'delete':
                                  print("delete id: " + product.id.toString());
                                  classProv.deleteClass(product.id.toString());
                                  break;
                                case 'update':
                                  idKelas = product.id;
                                  classData = {
                                    "title": product.title,
                                    "banner": product.banner,
                                    "class_id": product.id,
                                  };
                                  goPush(ClassEdit());
                                  break;
                              }
                            });
                      })
                    : Text("")
                // Text(
                //   "${product.teacherId} tugas",
                //   style: const TextStyle(
                //     fontSize: 15,
                //     color: Colors.white,
                //   ),
                // ),
                // const Padding(padding: EdgeInsets.only(bottom: 5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
