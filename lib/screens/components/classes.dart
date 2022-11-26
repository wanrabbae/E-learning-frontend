import 'package:e_learning_app/core/model/class_model.dart';
import 'package:e_learning_app/core/model/product_model.dart';
import 'package:e_learning_app/core/provider/class_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
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
          goPush(ClassTemplate());
        },
        child: Container(
          // padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: NetworkImage("https://source.unsplash.com/random")),
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
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
