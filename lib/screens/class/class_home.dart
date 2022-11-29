import 'package:e_learning_app/core/provider/class_provider.dart';
import 'package:e_learning_app/core/provider/detailClass_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/material.dart';
import 'package:e_learning_app/screens/class/material_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class ClassHome extends StatefulWidget {
  const ClassHome({Key? key}) : super(key: key);

  @override
  State<ClassHome> createState() => _ClassHomeState();
}

class _ClassHomeState extends State<ClassHome> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   DetailClassProvider().getDetailClass(idClass);
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailClassProvider(),
      child: Scaffold(body: Consumer<DetailClassProvider>(
        builder: (context, classProv, _) {
          return classProv.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          margin: EdgeInsets.only(bottom: 10),
                          // padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.darken),
                                  fit: BoxFit.cover,
                                  image: classProv.banner != null
                                      ? classProv.banner
                                              .toString()
                                              .contains("null")
                                          ? NetworkImage(
                                              "https://picsum.photos/500/300")
                                          : NetworkImage(
                                              classProv.banner.toString())
                                      : NetworkImage(
                                          "https://picsum.photos/500/300")),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const Padding(padding: EdgeInsets.only(top: 5)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      classProv.kelas,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Materi: " +
                                              classProv.listMateri!.length
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Tugas: " +
                                              classProv.listAssigment!.length
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    )
                                    // Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                                  ],
                                ),
                                // const Padding(padding: EdgeInsets.only(bottom: 5)),
                              ],
                            ),
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            itemCount: classProv.listMateri!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 5,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              var i = classProv.listMateri![index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      blurRadius: 10,
                                      offset: Offset(2, 3),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    goPush(MaterialView());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Icon(
                                          PhosphorIcons.book,
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 125,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  i.title.toString(),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Text(
                                                  "1 Nov",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color:
                                                          Colors.grey.shade500),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: lebar / 3.9,
                                          ),
                                          role!.toLowerCase() == "guru"
                                              ? PopupMenuButton(
                                                  icon: Icon(Icons.more_vert,
                                                      color: Colors
                                                          .black), // add this line
                                                  itemBuilder: (_) =>
                                                      <PopupMenuItem<String>>[
                                                        PopupMenuItem<String>(
                                                            child: Container(
                                                                width: 100,
                                                                // height: 30,
                                                                child: Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .red[
                                                                          400]),
                                                                )),
                                                            value: 'delete'),
                                                        PopupMenuItem<String>(
                                                            child: Container(
                                                                width: 100,
                                                                // height: 30,
                                                                child: Text(
                                                                  "Edit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .blue[
                                                                          400]),
                                                                )),
                                                            value: 'update'),
                                                      ],
                                                  onSelected: (index) async {
                                                    switch (index) {
                                                      case 'delete':
                                                        print("delete id: ");
                                                        break;
                                                      case 'update':
                                                        goPush(MaterialEdit());
                                                        print("update");
                                                        break;
                                                    }
                                                    ;
                                                  })
                                              : Text("")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                );
        },
      )),
    );
  }
}
