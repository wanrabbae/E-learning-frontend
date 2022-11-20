import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/core/model/product_model.dart';
import 'package:e_learning_app/core/model/quotes_model.dart';
import 'package:e_learning_app/services/quotes_service.dart';
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
  var quote;

  void getQuotes() async {
    try {
      GoogleTranslator translator = GoogleTranslator();
      var response = await Dio().get(quotesEndpoint);
      if (response.statusCode == 200) {
        var translated = await translator.translate(response.data[0]["q"],
            from: "en", to: "id");
        setState(() {
          quote = translated;
          // themeData = "dark";
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: kpink,
          onRefresh: () async {
            return getQuotes();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi Alwan",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '"$quote"',
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
                                decoration: BoxDecoration(
                                    color: kpurple,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Image.asset(
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  }
}
