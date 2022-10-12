import 'package:e_learning_app/model/product_model.dart';
import 'package:flutter/material.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.6),
        itemBuilder: (context, index) => ClassCard(
              product: products[index],
            ));
  }
}

class ClassCard extends StatelessWidget {
  const ClassCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: product.color, borderRadius: BorderRadius.circular(15.0)),
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
                    product.title,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(
                    "Guru: ${product.teacher}",
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                "${product.courses} tugas",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              // const Padding(padding: EdgeInsets.only(bottom: 5)),
            ],
          ),
        ),
      ),
    );
  }
}
