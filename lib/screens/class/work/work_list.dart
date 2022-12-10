import 'package:e_learning_app/core/provider/detailClass_provider.dart';
import 'package:e_learning_app/core/provider/work_provider.dart';
import 'package:e_learning_app/core/utils/component.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/work/work_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class WorkList extends StatefulWidget {
  const WorkList({Key? key}) : super(key: key);

  @override
  State<WorkList> createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkProvider(),
      child: Consumer<WorkProvider>(builder: (context, workProv, _) {
        return workProv.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: customAppBar1(namaKelas.toString(), context),
                body: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    workProv.listWorks!.length.toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    "Diserahkan",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ]),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 0.5)),
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    "Diterima",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ]),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 0.5)),
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    "Ditolak",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        // alignment: Alignment.le,
                        width: double.infinity,
                        child: Text(
                          "Murid yang sudah mengumpulkan tugas: ",
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 20),
                      workProv.listWorks!.length > 0
                          ? GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              itemCount: workProv.listWorks!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 5,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                var i = workProv.listWorks![index];
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
                                      workData = {
                                        "user": i.user,
                                        "id": i.id,
                                        "status": i.status,
                                        "file": i.file,
                                      };
                                      goPush(WorkDetail());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(i.user!.photo),
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
                                                    i.user!.nama.toString(),
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Text("")
                    ]),
                  ),
                ),
              );
      }),
    );
  }
}
