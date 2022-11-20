import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ClassHome extends StatefulWidget {
  const ClassHome({Key? key}) : super(key: key);

  @override
  State<ClassHome> createState() => _ClassHomeState();
}

class _ClassHomeState extends State<ClassHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //       SliverAppBar(
      //         leading: Icon(PhosphorIcons.arrowArcLeftFill),
      //         backgroundColor: Colors.transparent,
      //         elevation: 0,
      //         floating: true,
      //         forceElevated: innerBoxIsScrolled,
      //       ),
      //     ];
      //   },
      //   body: Container(
      //     margin: EdgeInsets.only(top: 30),
      //     padding: EdgeInsets.symmetric(horizontal: 15),
      //     child: Column(
      //       children: [
      //         Container(
      //           width: double.infinity,
      //           height: 200,
      //           // margin: EdgeInsets.only(botto),
      //           // padding: const EdgeInsets.all(10.0),
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   colorFilter: ColorFilter.mode(
      //                       Colors.black.withOpacity(0.3), BlendMode.darken),
      //                   fit: BoxFit.cover,
      //                   image: NetworkImage(
      //                       // "https://images.unsplash.com/photo-1546410531-bb4caa6b424d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"
      //                       "https://source.unsplash.com/random")),
      //               borderRadius: BorderRadius.circular(15.0)),
      //           child: Padding(
      //             padding:
      //                 const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 // const Padding(padding: EdgeInsets.only(top: 5)),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Nama Mapel",
      //                       style: const TextStyle(
      //                           fontSize: 18,
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w600),
      //                     ),
      //                     // Padding(padding: EdgeInsets.symmetric(vertical: 5)),
      //                   ],
      //                 ),
      //                 // const Padding(padding: EdgeInsets.only(bottom: 5)),
      //               ],
      //             ),
      //           ),
      //         ),
      //         GridView.builder(
      //             shrinkWrap: true,
      //             scrollDirection: Axis.vertical,
      //             physics: ScrollPhysics(),
      //             itemCount: 10,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 1,
      //                 childAspectRatio: 5,
      //                 mainAxisSpacing: 10),
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 padding:
      //                     EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(10),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Color.fromRGBO(0, 0, 0, 0.1),
      //                       blurRadius: 10,
      //                       offset: Offset(2, 3),
      //                     ),
      //                   ],
      //                 ),
      //                 child: InkWell(
      //                   onTap: () {},
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         child: Icon(
      //                           PhosphorIcons.book,
      //                           size: 25,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 10,
      //                       ),
      //                       Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Text(
      //                             "Judul Materi",
      //                             style: TextStyle(fontSize: 12),
      //                           ),
      //                           Text(
      //                             "1 Nov",
      //                             style: TextStyle(
      //                                 fontSize: 11,
      //                                 color: Colors.grey.shade500),
      //                           )
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             })
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
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
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          // "https://images.unsplash.com/photo-1546410531-bb4caa6b424d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"
                          "https://source.unsplash.com/random")),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Padding(padding: EdgeInsets.only(top: 5)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Mapel",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
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
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                "Judul Materi",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "1 Nov",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade500),
                              )
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
  }
}
