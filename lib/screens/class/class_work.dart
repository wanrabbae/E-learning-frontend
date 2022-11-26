import 'package:e_learning_app/core/provider/detailClass_provider.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/assignment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class ClassWork extends StatefulWidget {
  const ClassWork({Key? key}) : super(key: key);

  @override
  State<ClassWork> createState() => _ClassWorkState();
}

class _ClassWorkState extends State<ClassWork> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailClassProvider(),
      child: Scaffold(
        // appBar: AppBar(leading: Icon(PhosphorIcons.arrowArcLeftFill)),
        body: Consumer<DetailClassProvider>(builder: (context, classProv, _) {
          return classProv.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: classProv.listAssigment!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 5,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        var i = classProv.listAssigment![index];
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                              goPush(AssignmentView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      i.title.toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      i.expired!.toString().substring(0, 10),
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
        }),
      ),
    );
  }
}
