import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/provider/class_provider.dart';
import 'package:e_learning_app/core/provider/dashboard_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/model/product_model.dart';
import 'package:e_learning_app/core/model/quotes_model.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/class/class_add.dart';
import 'package:e_learning_app/services/quotes_service.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/classes.dart';
import 'components/sorting.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DashboardProvider(),
        child: Consumer<DashboardProvider>(builder: (context, dashProv, _) {
          return dashProv.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  floatingActionButton: role!.toLowerCase() == "guru"
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: FloatingActionButton(
                            onPressed: () {
                              goPush(ClassAdd());
                            },
                            backgroundColor: kpink,
                            child: Icon(Icons.add),
                          ),
                        )
                      : Text(""),
                  body: SafeArea(
                    child: RefreshIndicator(
                      color: kpink,
                      onRefresh: () async {
                        dashProv.init();
                      },
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hi ${dashProv.data!.nama}",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              '"${dashProv.quote}"',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  wordSpacing: 1.5,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            child: dashProv.data!.photo != null
                                                ? CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(dashProv
                                                            .data!.photo
                                                            .toString()),
                                                  )
                                                : Image.asset(
                                                    "assets/images/profile.png",
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                //class list

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Kelas",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //now we create model of our images and colors which we will use in our app
                                const SizedBox(
                                  height: 20,
                                ),
                                //we can not use gridview inside column
                                //use shrinkwrap and physical scroll
                                ClassList(),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        }));
  }
}
